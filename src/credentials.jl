const TOKEN_STORAGE_MAGIC = b"HDTS"
const TOKEN_STORAGE_VERSION = UInt8(0)

# token protocol: https://github.com/hanborq/hadoop/blob/master/src/core/org/apache/hadoop/security/Credentials.java
struct Credentials
    tokens::Dict{AbstractString,TokenProto}
    secrets::Dict{AbstractString,Vector{UInt8}}

    function Credentials()
        new(Dict{AbstractString,TokenProto}(), Dict{AbstractString,Vector{UInt8}}())
    end
end

function read_credentials!(token_file::String; credentials::Credentials=Credentials())
    open(token_file, "r") do io
        read_credentials!(io; credentials=credentials)
    end
    credentials
end

function read_credentials!(io::IO; credentials::Credentials=Credentials())
    hdts = Vector{UInt8}(undef, 4)
    readbytes!(io, hdts)
    (hdts == TOKEN_STORAGE_MAGIC) || error("Bad header found in token storage")
    version = read(io, UInt8)
    (version == TOKEN_STORAGE_VERSION) || error("Unknown version $version in token storage (expected $TOKEN_STORAGE_VERSION)")

    # read tokens
    size = ProtoBuf.read_varint(io, Int32)
    for idx in 1:size
        alias = ProtoBuf.read_string(io)

        identifier = ProtoBuf.read_bytes(io)
        password = ProtoBuf.read_bytes(io)
        kind = ProtoBuf.read_string(io)
        service = ProtoBuf.read_string(io)
        token = TokenProto(; identifier=identifier, password=password, kind=kind, service=service)

        if isempty(alias)
            alias = string(token.service, token.kind)
        end

        credentials.tokens[alias] = token
    end

    # read secrets
    size = ProtoBuf.read_varint(io, Int32)
    for idx in 1:size
        alias = ProtoBuf.read_string(io)
        secret = ProtoBuf.read_bytes(io)
        credentials.secrets[alias] = secret
    end
    credentials
end

add_token!(credentials::Credentials, token::TokenProto) = add_token!(credentials, string(token.service, token.kind), token)
add_token!(credentials::Credentials, alias::AbstractString, token::TokenProto) = (credentials.tokens[alias] = token; nothing)

_match_alias(alias, pattern) = isempty(pattern) || (pattern == alias)
_match_kind(token, pattern) = isempty(pattern) || (pattern == token.kind)
_match_token(dict_entry, alias_pattern, kind_pattern) = _match_alias(first(dict_entry), alias_pattern) && _match_kind(last(dict_entry), kind_pattern)
find_tokens(credentials::Credentials; alias::AbstractString="", kind::AbstractString="") = collect(values(filter(x->_match_token(x, alias, kind), credentials.tokens)))
