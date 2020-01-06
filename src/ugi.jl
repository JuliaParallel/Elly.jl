# Basic UserGroupInformation to store user information and tokens,
# realUser: what it is at client side
# effectiveUser: set this to specify what this should be proxied as at the server end
# ref: https://www.opencore.com/blog/2016/5/user-name-handling-in-hadoop/
mutable struct UserGroupInformation
    userinfo::UserInformationProto
    credentials::Credentials

    function UserGroupInformation(username::AbstractString=default_username(); proxy::Bool=false, proxyuser::AbstractString=username)
        userinfo = proxy ? protobuild(UserInformationProto, Dict(:realUser => username, :effectiveUser => proxyuser)) : protobuild(UserInformationProto, Dict(:realUser => username))
        ugi = new(userinfo, Credentials())
        haskey(ENV, "HADOOP_TOKEN_FILE_LOCATION") && read_credentials!(ENV["HADOOP_TOKEN_FILE_LOCATION"]; credentials=ugi.credentials)
        ugi
    end
end

function default_username()
    ("HADOOP_USER_NAME" in keys(ENV)) && (return ENV["HADOOP_USER_NAME"])
    ("USER" in keys(ENV)) && (return ENV["USER"])
    error("Can not determine user information. Either HADOOP_USER_NAME or USER must be set.")
end

add_token!(ugi::UserGroupInformation, token::TokenProto) = add_token!(ugi.credentials, token)
add_token!(ugi::UserGroupInformation, alias::AbstractString, token::TokenProto) = add_token!(ugi.credentials, alias, token)

username(userinfo::UserInformationProto) = isfilled(userinfo, :realUser) ? userinfo.realUser : userinfo.effectiveUser
username(ugi::UserGroupInformation) = username(ugi.userinfo)

find_tokens(ugi::UserGroupInformation; alias::AbstractString="", kind::AbstractString="") = find_tokens(ugi.credentials; alias=alias, kind=kind)

function show(io::IO, ugi::UserGroupInformation)
    uinfo = ugi.userinfo
    print(io, "User:")
    isfilled(uinfo, :realUser) && print(io, ' ', uinfo.realUser)
    isfilled(uinfo, :effectiveUser) && print(io, " (", uinfo.effectiveUser, ')')
    isempty(ugi.credentials.tokens) || print(io, " with ", length(ugi.credentials.tokens), " tokens")
    nothing
end
