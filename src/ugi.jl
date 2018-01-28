# Basic UserGroupInformation to store user information and tokens,
mutable struct UserGroupInformation
    userinfo::UserInformationProto
    tokens::Dict{AbstractString,TokenProto}
    function UserGroupInformation(username::AbstractString="")
        isempty(username) && (username = ENV["USER"])
        userinfo = protobuild(UserInformationProto, Dict(:realUser => username))
        new(userinfo, Dict{AbstractString,TokenProto}())
    end
end

add_token(ugi::UserGroupInformation, token::TokenProto) = add_token(ugi, token.service, token)
add_token(ugi::UserGroupInformation, alias::AbstractString, token::TokenProto) = (ugi.tokens[alias] = token; nothing)

username(userinfo::UserInformationProto) = isfilled(userinfo, :realUser) ? userinfo.realUser : userInfo.effectiveUser
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
