# Basic UserGroupInformation to store user information and tokens,
type UserGroupInformation
    userinfo::UserInformationProto
    tokens::Dict{AbstractString,TokenProto}
    function UserGroupInformation(username::AbstractString="")
        isempty(username) && (username = ENV["USER"])
        userinfo = protobuild(UserInformationProto, @compat Dict(:realUser => username))
        new(userinfo, Dict{AbstractString,TokenProto}())
    end
end

add_token(ugi::UserGroupInformation, token::TokenProto) = add_token(ugi, token.service, token)
addtoken(ugi::UserGroupInformation, alias::AbstractString, token::TokenProto) = (ugi.tokens[alias] = token; nothing)

username(userinfo::UserInformationProto) = isfilled(userinfo, :realUser) ? userinfo.realUser : userInfo.effectiveUser
username(ugi::UserGroupInformation) = username(ugi.userinfo)
