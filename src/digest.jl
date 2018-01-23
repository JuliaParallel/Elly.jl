const OPENSSL_LIB = "libcrypto"

md5init() = ccall((:OpenSSL_add_all_digests, OPENSSL_LIB), Void, ())
md5cleanup() = ccall((:EVP_cleanup, OPENSSL_LIB), Void, ())

function md5(v...)
    iob = IOBuffer()
    write(iob, v...)
    ctx = ccall((:EVP_MD_CTX_create, OPENSSL_LIB), Ptr{Void}, ())
    try
        md = ccall((:EVP_get_digestbyname, OPENSSL_LIB), Ptr{Void}, (Ptr{UInt8},), "MD5")
        (md == C_NULL) && error("Unknown message digest $name")

        ccall((:EVP_DigestInit_ex, OPENSSL_LIB), Void, (Ptr{Void}, Ptr{Void}, Ptr{Void}), ctx, md, C_NULL)

        data = take!(iob)
        ccall((:EVP_DigestUpdate, OPENSSL_LIB), Void, (Ptr{Void}, Ptr{UInt8}, UInt), ctx, data, length(data))

        size = ccall((:EVP_MD_size, OPENSSL_LIB), UInt, (Ptr{Void},), md)
        uval = Array(UInt8, size)

        ccall((:EVP_DigestFinal_ex, OPENSSL_LIB), Void, (Ptr{Void}, Ptr{UInt8}, Ptr{UInt}), ctx, uval, C_NULL)

        return uval
    finally
        ccall((:EVP_MD_CTX_destroy, OPENSSL_LIB), Void, (Ptr{Void},), ctx)
    end
end
