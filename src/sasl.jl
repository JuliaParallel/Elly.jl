# DIGEST-MD5 mechanism
function md5(v...)
    iob = IOBuffer()
    write(iob, v...)
    digest(MD_MD5, take!(iob))
end

function digmd5_decode_challenge(challenge::AbstractString)
    comps = Dict{AbstractString,AbstractString}()
    for comp in split(challenge, ',')
        (n,v) = split(comp, '='; limit=2)
        lv = length(v)
        if (lv > 1) && startswith(v, '"') && endswith(v, '"')
            v = SubString(v, 2, lv-1)
        end
        comps[n] = v
    end
    @debug("decoded challenge components: $comps")
    comps
end

function digmd5_challenge_isvalid(challenge::Dict{AbstractString,AbstractString})
    !isempty(get(challenge, "realm", "")) && 
    !isempty(get(challenge, "nonce", "")) &&
    ("auth" == get(challenge, "qop", "")) &&
    ("utf-8" == get(challenge, "charset", "")) &&
    ("md5-sess" == get(challenge, "algorithm", ""))
end

const SASL_DIGESTMD5_CHARSET = "utf-8"
const SASL_DIGESTMD5_NC = "00000001"
const SASL_DIGESTMD5_MAXBUF = "65536"
const SASL_DIGESTMD5_METHOD = "AUTHENTICATE"

function digmd5_respond(username::AbstractString, password::AbstractString, digesturi::AbstractString, challenge::Dict{AbstractString,AbstractString})
    cnonce = randstring(40)
    realm = challenge["realm"]
    nonce = challenge["nonce"]
    qop = challenge["qop"]

    # if qop directive is "auth":
    # HA1=MD5(MD5(username:realm:password):nonce:cnonce)
    # HA2=MD5(method:digestURI)
    # response=MD5(HA1:nonce:nonceCount:clientNonce:qop:HA2)
    HA1_1 = md5(username, ':', realm, ':', password)
    HA1 = md5(HA1_1, ':', nonce, ':', cnonce)
    HA2 = md5(SASL_DIGESTMD5_METHOD, ':', digesturi)
    response = md5(bytes2hex(HA1), ':', nonce, ':', SASL_DIGESTMD5_NC, ':', cnonce, ':', qop, ':', bytes2hex(HA2))

    iob = IOBuffer()
    write(iob, "charset=",      SASL_DIGESTMD5_CHARSET, ',',
               "username=",     '"', username, '"',     ',',
               "realm=",        '"', realm, '"',        ',',
               "nonce=",        '"', nonce, '"',        ',',
               "nc=",           SASL_DIGESTMD5_NC,      ',',
               "cnonce=",       '"', cnonce, '"',       ',',
               "digest-uri=",   '"', digesturi, '"',    ',',
               "maxbuf=",       SASL_DIGESTMD5_MAXBUF,  ',',
               "response=",     bytes2hex(response),    ',',
               "qop=",          qop)
    String(take!(iob))
end

function testdigmd5(username::AbstractString, password::AbstractString, protocol::AbstractString, serverid::AbstractString, challenge::AbstractString)
    parts = digmd5_decode_challenge(challenge)
    digmd5_challenge_isvalid(parts) || error("invalid challenge params")
    digesturi = protocol * "/" * serverid
    digmd5_respond(username, password, digesturi, parts)
end

function digmd5_respond(token::TokenProto, protocol::AbstractString, serverid::AbstractString, challenge::Vector{UInt8})
    isempty(challenge) && error("empty challenge")
    parts = digmd5_decode_challenge(String(challenge))
    digmd5_challenge_isvalid(parts) || error("invalid challenge params")
    digesturi = protocol * "/" * serverid
    digmd5_respond(base64encode(token.identifier), base64encode(token.password), digesturi, parts)
end

buffer_sasl_reqhdr(channel::HadoopRpcChannel) = (channel.sent_call_id = channel.call_id = HRPC_CALL_ID_SASL; buffer_reqhdr(channel, HRPC_CALL_ID_SASL))

function buffer_sasl_message(channel::HadoopRpcChannel, state::Int32, auths::Vector{RpcSaslProto_SaslAuth}=RpcSaslProto_SaslAuth[], token::Vector{UInt8}=UInt8[])
    @debug("buffer SASL message. state:$state, nauths:$(length(auths)), token:$(!isempty(token))")
    saslmsg = protobuild(RpcSaslProto, Dict(:version => 0, :state => state))
    isempty(auths) || set_field!(saslmsg, :auths, auths)
    isempty(token) || set_field!(saslmsg, :token, token)
    buffer_size_delimited(channel.iob, saslmsg)
end

function recv_sasl_message(channel::HadoopRpcChannel)
    @debug("recv SASL message")
    resp = RpcSaslProto()
    recv_rpc_message(channel, resp)
    @debug("received SASL message $resp")
    resp
end

token_alias(host::AbstractString, port::Integer) = "$(host):$(port)"
token_alias(channel::HadoopRpcChannel) = token_alias(channel.host, channel.port)
token_alias(nodeid::NodeIdProto) = token_alias(nodeid.host, nodeid.port)

function conditional_sasl_auth(channel::HadoopRpcChannel)
    # select appropriate token from ugi
    tok_alias = token_alias(channel)
    tokens = find_tokens(channel.ugi, alias=tok_alias)
    if isempty(tokens)
        @debug("no token available to authenticate to $tok_alias. skipping")
        return false
    end
    @debug("found $(length(tokens)) tokens available to authenticate to $tok_alias. authenticating...")
    token = tokens[1]
    sasl_auth(channel, token)
    true
end

function sasl_auth(channel::HadoopRpcChannel, token::TokenProto)
    # send sasl handshake request
    begin_send(channel)
    buffer_handshake(channel, HRPC_AUTH_PROTOCOL_SASL)
    send_buffered(channel, false)

    # send sasl negotiate request
    begin_send(channel)
    buffer_sasl_reqhdr(channel)
    buffer_sasl_message(channel, RpcSaslProto_SaslState.NEGOTIATE)
    send_buffered(channel, true)
    resp = recv_sasl_message(channel)

    # check if TOKEN/DIGEST-MD5 is one of the supported methods
    nauths = length(resp.auths)
    @debug("server supports $nauths auths")
    idx_auth = 0
    for idx in 1:length(resp.auths)
        auth = resp.auths[idx]
        @debug("    $idx: $(auth.method)/$(auth.mechanism)")
        ((auth.method == "TOKEN") && (auth.mechanism == "DIGEST-MD5")) || continue
        idx_auth = idx
    end
    if idx_auth == 0
        @debug("no supported auth method found")
        throw(HadoopRpcException("no supported authentication method found"))
    end
    auth = resp.auths[idx_auth]

    # create response to the challenge
    protocol = auth.protocol
    serverId = auth.serverId
    challenge = auth.challenge
    @debug("auth.protocol: $protocol, serverId: $serverId, challenge: $challenge")
    response = digmd5_respond(token, auth.protocol, auth.serverId, auth.challenge)
    @debug("response: $response")

    # send response as a sasl initiate request
    respauth = protobuild(RpcSaslProto_SaslAuth, Dict(:method => auth.method,
                :mechanism => auth.mechanism,
                :protocol => auth.protocol,
                :serverId => auth.serverId))

    begin_send(channel)
    buffer_sasl_reqhdr(channel)
    buffer_sasl_message(channel, RpcSaslProto_SaslState.INITIATE, [respauth], convert(Vector{UInt8}, codeunits(response)))
    send_buffered(channel, true)
    resp = recv_sasl_message(channel)

    # expect a success response
    if resp.state != RpcSaslProto_SaslState.SUCCESS
        @debug("error completing SASL auth. state: $(resp.state). expected state: $(RpcSaslProto_SaslState.SUCCESS)")
        throw(HadoopRpcException("error completing SASL auth. state: $(resp.state). expected state: $(RpcSaslProto_SaslState.SUCCESS)"))
    end
    nothing
end
