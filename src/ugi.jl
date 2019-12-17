# Basic UserGroupInformation to store user information and tokens,
# realUser: what it is at client side
# effectiveUser: set this to specify what this should be proxied as at the server end
# ref: https://www.opencore.com/blog/2016/5/user-name-handling-in-hadoop/
mutable struct UserGroupInformation
    userinfo::UserInformationProto
    tokens::Dict{AbstractString,TokenProto}
    function UserGroupInformation(username::AbstractString=default_username(); proxy::Bool=false, proxyuser::AbstractString=username)
        userinfo = proxy ? protobuild(UserInformationProto, Dict(:realUser => username, :effectiveUser => proxyuser)) : protobuild(UserInformationProto, Dict(:realUser => username))
        new(userinfo, Dict{AbstractString,TokenProto}())
    end
end

function default_username()
    ("HADOOP_USER_NAME" in keys(ENV)) && (return ENV["HADOOP_USER_NAME"])
    ("USER" in keys(ENV)) && (return ENV["USER"])
    error("Can not determine user information. Either HADOOP_USER_NAME or USER must be set.")
end

add_token(ugi::UserGroupInformation, token::TokenProto) = add_token(ugi, token.service, token)
add_token(ugi::UserGroupInformation, alias::AbstractString, token::TokenProto) = (ugi.tokens[alias] = token; nothing)

username(userinfo::UserInformationProto) = isfilled(userinfo, :realUser) ? userinfo.realUser : userinfo.effectiveUser
username(ugi::UserGroupInformation) = username(ugi.userinfo)

function find_tokens(ugi::UserGroupInformation; alias::AbstractString="", kind::AbstractString="")
    isempty(alias) && isempty(kind) && (return collect(values(ugi.tokens)))

    result = TokenProto[]
    !isempty(alias) && (alias in keys(ugi.tokens)) && push!(result, ugi.tokens[alias])
    if !isempty(kind)
        for tok in values(ugi.tokens)
            (tok.kind == kind) && push!(result, tok)
        end
    end
    result
end

function show(io::IO, ugi::UserGroupInformation)
    uinfo = ugi.userinfo
    print(io, "User:")
    isfilled(uinfo, :realUser) && print(io, ' ', uinfo.realUser)
    isfilled(uinfo, :effectiveUser) && print(io, " (", uinfo.effectiveUser, ')')
    isempty(ugi.tokens) || print(io, " with ", length(ugi.tokens), " tokens")
    nothing
end
