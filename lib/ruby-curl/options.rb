module RubyCurl

  CURLOPTTYPE_LONG          = 0
  CURLOPTTYPE_OBJECTPOINT   = 10000
  CURLOPTTYPE_FUNCTIONPOINT = 20000

  class Easy

    # The full URL to get/put 
    CURLOPT_URL  = CURLOPTTYPE_OBJECTPOINT + 2
  
    # Port number to connect to, if other than default.
    # CURLOPT_PORT = CURLOPTTYPE_LONG + 3
  
    # Name of proxy to use.
    # CURLOPT_PROXY = CURLOPTTYPE_OBJECTPOINT + 4
  
    # "name:password" to use when fetching.
    # CURLOPT_USERPWD = CURLOPTTYPE_OBJECTPOINT + 5
  
    # "name:password" to use with proxy.
    # CURLOPT_PROXYUSERPWD = CURLOPTTYPE_OBJECTPOINT + 6
  
    # Range to get, specified as an ASCII string.
    # CURLOPT_RANGE = CURLOPTTYPE_OBJECTPOINT + 7
  
    # 8 Not used

    # Specified file stream to upload from (use as input):
    # CURLOPT_INFILE = CURLOPTTYPE_OBJECTPOINT + 9
  
    # Buffer to receive error messages in, must be at least CURL_ERROR_SIZE
    # bytes big. If this is not used, error messages go to stderr instead:
    # CURLOPT_ERRORBUFFER = CURLOPTTYPE_OBJECTPOINT + 10
  
    # Function that will be called to store the output (instead of fwrite).
    # The parameters will use fwrite() syntax, make sure to follow them.
    # CURLOPT_WRITEFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 11
  
    # Function that will be called to read the input (instead of fread).The
    # parameters will use fread() syntax, make sure to follow them.
    # CURLOPT_READFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 12
  
    # Time-out the read operation after this amount of seconds
    # CURLOPT_TIMEOUT = CURLOPTTYPE_LONG + 13
  
    # If the CURLOPT_INFILE is used, this can be used to inform libcurl about
    # how large the file being sent really is. That allows better error
    # checking and better verifies that the upload was successful. -1 means
    # unknownsize.
  
    # For large file support, there is also a _LARGE version of the key
    # which takes an off_t type, allowing platforms with larger off_t
    # sizes to handle larger files. See below for INFILESIZE_LARGE.
    # CURLOPT_INFILESIZE = CURLOPTTYPE_LONG + 14
  
    # POST static input fields.
    CURLOPT_POSTFIELDS = CURLOPTTYPE_OBJECTPOINT + 15
  
    # Set the referrer page (needed by some CGIs)
    # CURLOPT_REFERER = CURLOPTTYPE_OBJECTPOINT + 16
  
    # Set the FTP PORT string (interface name, named or numerical IP address)
    # Use i.e '-' to use default address.
    # CURLOPT_FTPPORT = CURLOPTTYPE_OBJECTPOINT + 17
  
    # Set the User-Agent string (examined by some CGIs)
    # CURLOPT_USERAGENT = CURLOPTTYPE_OBJECTPOINT + 18
  
    # If the download receives less than "low speed limit" bytes/second
    # during "low speed time" seconds, the operations is aborted.
    # You could i.e if you have a pretty high speed connection, abort if
    # it is less than 2000 bytes/sec during 20 seconds.
  
    # Set the "low speed limit"
    # CURLOPT_LOW_SPEED_LIMIT = CURLOPTTYPE_LONG + 19
  
    # Set the "low speed time"
    # CURLOPT_LOW_SPEED_TIME = CURLOPTTYPE_LONG + 20
  
    # Set the continuation offset.
    # Note there is also a _LARGE version of this key which uses
    # off_t types, allowing for large file offsets on platforms which
    # use larger-than-32-bit off_t's. Look below for RESUME_FROM_LARGE.
    # CURLOPT_RESUME_FROM = CURLOPTTYPE_LONG + 21
  
    # Set cookie in request:
    # CURLOPT_COOKIE = CURLOPTTYPE_OBJECTPOINT + 22
  
    # This points to a linked list of headers, struct curl_slist kind
    CURLOPT_HTTPHEADER = CURLOPTTYPE_OBJECTPOINT + 23
  
    # This points to a linked list of post entries, struct curl_httppost
    # CURLOPT_HTTPPOST = CURLOPTTYPE_OBJECTPOINT + 24
  
    # name of the file keeping your private SSL-certificate
    # CURLOPT_SSLCERT = CURLOPTTYPE_OBJECTPOINT + 25
  
    # password for the SSL or SSH private key
    # CURLOPT_KEYPASSWD = CURLOPTTYPE_OBJECTPOINT + 26
  
    # send TYPE parameter?
    # CURLOPT_CRLF = CURLOPTTYPE_LONG + 27
  
    # send linked-list of QUOTE commands
    # CURLOPT_QUOTE = CURLOPTTYPE_OBJECTPOINT + 28
  
    # send FILE * or void * to store headers to, if you use a callback it
    # is simply passed to the callback unmodified 
    # CURLOPT_WRITEHEADER = CURLOPTTYPE_OBJECTPOINT + 29
  
    # point to a file to read the initial cookies from, also enables
    # "cookie awareness"
    CURLOPT_COOKIEFILE = CURLOPTTYPE_OBJECTPOINT + 31
  
    # What version to specifically try to use.
    # See CURL_SSLVERSION defines below.
    # CURLOPT_SSLVERSION = CURLOPTTYPE_LONG + 32
  
    # What kind of HTTP time condition to use, see defines
    # CURLOPT_TIMECONDITION = CURLOPTTYPE_LONG + 33
  
    # Time to use with the above condition. Specified in number of seconds
    # since 1 Jan 1970
    # CURLOPT_TIMEVALUE = CURLOPTTYPE_LONG + 34
  
    # 35 = OBSOLETE
  
    # Custom request, for customizing the get commandlike
    # HTTP: DELETE, TRACE and others
    # FTP: to use a different list command
    CURLOPT_CUSTOMREQUEST = CURLOPTTYPE_OBJECTPOINT + 36
  
    # HTTP request, for odd commands like DELETE, TRACE and others
    # CURLOPT_STDERR = CURLOPTTYPE_OBJECTPOINT + 37
  
    # 38 is not used
  
    # send linked-list of post-transfer QUOTE commands
    # CURLOPT_POSTQUOTE = CURLOPTTYPE_OBJECTPOINT + 39
  
    # Pass a pointer to string of the output using full variable-replacement
    # as described elsewhere.
    # CURLOPT_WRITEINFO = CURLOPTTYPE_OBJECTPOINT + 40
  
    # Display a lot of verbose information about its operations.
    CURLOPT_VERBOSE = CURLOPTTYPE_LONG + 41

    # Include the header in the body output.
    # CURLOPT_HEADER = CURLOPTTYPE_LONG + 42

    # Shut off the built-in progress meter completely.
    CURLOPT_NOPROGRESS = CURLOPTTYPE_LONG + 43

    # Do not include the body-part in the output.
    # On HTTP(S) servers, this will make libcurl do a HEAD request.
    CURLOPT_NOBODY = CURLOPTTYPE_LONG + 44

    # Fail silently if the HTTP code returned is equal to or larger than 400
    # The default action would be to return the page normally, 
    # ignoring that code.
    # CURLOPT_FAILONERROR = CURLOPTTYPE_LONG + 45

    # Tells the library to prepare for an upload.
    # If the protocol is HTTP, uploading means using the PUT request
    # unless you tell libcurl otherwise. 
    # CURLOPT_UPLOAD = CURLOPTTYPE_LONG + 46

    # Tells the library to do a regular HTTP post. This will also make the
    # library use a "Content-Type: application/x-www-form-urlencoded" header
    CURLOPT_POST = CURLOPTTYPE_LONG + 47

    # Just list the names of files in a directory, instead of doing a full
    # directory listing that would include file sizes, dates etc.
    # CURLOPT_DIRLISTONLY = CURLOPTTYPE_LONG + 48

    # Append to the remote file instead of overwrite it  
    # CURLOPT_APPEND = CURLOPTTYPE_LONG + 50
  
    # Specify whether to read the user+password from the .netrc or the URL.
    # This must be one of the CURL_NETRC_* enums below.
    # CURLOPT_NETRC = CURLOPTTYPE_LONG + 51

    # The library will re-send the same request on the new location and
    # follow new Location: headers all the way until no more such headers
    # are returned
    CURLOPT_FOLLOWLOCATION = CURLOPTTYPE_LONG + 52

    # Use ASCII mode for FTP transfers, instead of the default binary
    # transfer.
    # CURLOPT_TRANSFERTEXT = CURLOPTTYPE_LONG + 53

    # HTTP PUT - DEPRECATED in 7.12.1
    # CURLOPT_PUT = CURLOPTTYPE_LONG + 54
  
    # 55 = OBSOLETE
  
    # Function that will be called instead of the internal progress display
    # function. This function should be defined as the curl_progress_callback
    # prototype defines.
    # CURLOPT_PROGRESSFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 56
  
    # Data passed to the progress callback
    # CURLOPT_PROGRESSDATA = CURLOPTTYPE_OBJECTPOINT + 57
  
    # We want the referrer field set automatically when following locations
    CURLOPT_AUTOREFERER = CURLOPTTYPE_LONG + 58
  
    # Port of the proxy, can be set in the proxy string as well with:
    # "[host]:[port]"
    # CURLOPT_PROXYPORT = CURLOPTTYPE_LONG + 59
  
    # size of the POST input data, if strlen() is not good to use
    # CURLOPT_POSTFIELDSIZE = CURLOPTTYPE_LONG + 60
  
    # tunnel non-http operations through a HTTP proxy
    # CURLOPT_HTTPPROXYTUNNEL = CURLOPTTYPE_LONG + 61
  
    # Set the interface string to use as outgoing network interface
    CURLOPT_INTERFACE = CURLOPTTYPE_OBJECTPOINT + 62
  
    # Set the krb4/5 security level, this also enables krb4/5 awareness. This
    # is a string, 'clear', 'safe', 'confidential' or 'private'.  If the
    # string is set but doesn't match one of these, 'private' will be used. 
    # CURLOPT_KRBLEVEL = CURLOPTTYPE_OBJECTPOINT + 63
  
    # Set if we should verify the peer in ssl handshake, set 1 to verify.
    # CURLOPT_SSL_VERIFYPEER = CURLOPTTYPE_LONG + 64
  
    # The CApath or CAfile used to validate the peercertificate
    # this option is used only if SSL_VERIFYPEER is true
    # CURLOPT_CAINFO = CURLOPTTYPE_OBJECTPOINT + 65
  
    # 66 = OBSOLETE
    # 67 = OBSOLETE
  
    # Maximum number of http redirects to follow
    CURLOPT_MAXREDIRS = CURLOPTTYPE_LONG + 68
  
    # Pass a long set to 1 to get the date of the requested document (if
    # possible)! Pass a zero to shut it off.
    # CURLOPT_FILETIME = CURLOPTTYPE_LONG + 69
  
    # This points to a linked list of telnet options
    # CURLOPT_TELNETOPTIONS = CURLOPTTYPE_OBJECTPOINT + 70
  
    # Max amount of cached alive connections for this Easy handle
    # CURLOPT_MAXCONNECTS = CURLOPTTYPE_LONG + 71
  
    # OBSOLETE This option does nothing. 
    # CURLOPT_CLOSEPOLICY = CURLOPTTYPE_LONG + 72
  
    # 73 = OBSOLETE
  
    # Set to explicitly use a new connection for the upcoming transfer.
    # Do not use this unless you're absolutely sure of this, as it makes the
    # operation slower and is less friendly for the network.
    # CURLOPT_FRESH_CONNECT = CURLOPTTYPE_LONG + 74
  
    # Set to explicitly forbid the upcoming transfer's connection to be 
    # re-used when done. Do not use this unless you're absolutely sure of 
    # this as it makes the operation slower and is less friendly for
    # the network.
    # CURLOPT_FORBID_REUSE = CURLOPTTYPE_LONG + 75
  
    # Set to a file name that contains random data for libcurl to useto
    # seed the random engine when doing SSL connects.
    # CURLOPT_RANDOM_FILE = CURLOPTTYPE_OBJECTPOINT + 76
  
    # Set to the Entropy Gathering Daemon socket pathname
    # CURLOPT_EGDSOCKET = CURLOPTTYPE_OBJECTPOINT + 77
  
    # Time-out connect operations after this amount of seconds, if connects
    # are OK within this time, then fine... This only aborts the connect
    # phase. [Only works on unix-style/SIGALRM operating systems]
    # CURLOPT_CONNECTTIMEOUT = CURLOPTTYPE_LONG + 78
  
    # Function that will be called to store headers (instead of fwrite).The
    # parameters will use fwrite() syntax, make sure to follow them.
    # CURLOPT_HEADERFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 79
  
    # Set this to force the HTTP request to get back to GET. Only really 
    # usable if POST, PUT or a custom request have been used first.
    CURLOPT_HTTPGET = CURLOPTTYPE_LONG + 80
  
    # Set if we should verify the Common name from the peer certificate in 
    # handshake, set 1 to check existence, 2 to ensure that it matches the
    # provided hostname.
    # CURLOPT_SSL_VERIFYHOST = CURLOPTTYPE_LONG + 81
  
    # Specify which file name to write all known cookies in after completed
    # operation. Set file name to "-" (dash) to make it go to stdout.
    CURLOPT_COOKIEJAR = CURLOPTTYPE_OBJECTPOINT + 82
  
    # Specify which SSL ciphers to use
    # CURLOPT_SSL_CIPHER_LIST = CURLOPTTYPE_OBJECTPOINT + 83
  
    # Specify which HTTP version to use! This must be set to one of the
    # CURL_HTTP_VERSION* enums set below.
    # CURLOPT_HTTP_VERSION = CURLOPTTYPE_LONG + 84
  
    # Specifically switch on or off the FTP engine's use of the EPSV command.
    # By default, that one will always be attempted before the more
    # traditional PASV command.
    # CURLOPT_FTP_USE_EPSV = CURLOPTTYPE_LONG + 85
  
    # type of the file keeping your SSL-certificate ("DER", "PEM", "ENG")
    # CURLOPT_SSLCERTTYPE = CURLOPTTYPE_OBJECTPOINT + 86
  
    # name of the file keeping your private SSL-key
    # CURLOPT_SSLKEY = CURLOPTTYPE_OBJECTPOINT + 87
  
    # type of the file keeping your private SSL-key ("DER", "PEM", "ENG")
    # CURLOPT_SSLKEYTYPE = CURLOPTTYPE_OBJECTPOINT + 88
  
    # crypto engine for the SSL-sub system
    # CURLOPT_SSLENGINE = CURLOPTTYPE_OBJECTPOINT + 89
  
    # set the crypto engine for the SSL-sub system as default
    # the param has no meaning...
    # CURLOPT_SSLENGINE_DEFAULT = CURLOPTTYPE_LONG + 90
  
    # Non-zero value means to use the global dns cache
    # OBSOLETE!
    # CURLOPT_DNS_USE_GLOBAL_CACHE = CURLOPTTYPE_LONG + 91 
  
    # DNS cache timeout
    CURLOPT_DNS_CACHE_TIMEOUT = CURLOPTTYPE_LONG + 92
  
    # send linked-list of pre-transfer QUOTE commands
    # CURLOPT_PREQUOTE = CURLOPTTYPE_OBJECTPOINT + 93
  
    # set the debug function
    # CURLOPT_DEBUGFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 94
  
    # set the data for the debug function
    # CURLOPT_DEBUGDATA = CURLOPTTYPE_OBJECTPOINT + 95
  
    # mark this as start of a cookie session
    CURLOPT_COOKIESESSION = CURLOPTTYPE_LONG + 96
  
    # The CApath directory used to validate the peer certificate
    # this option is used only if SSL_VERIFYPEER is true
    # CURLOPT_CAPATH = CURLOPTTYPE_OBJECTPOINT + 97
  
    # Instruct libcurl to use a smaller receive buffer
    # CURLOPT_BUFFERSIZE = CURLOPTTYPE_LONG + 98
  
    # Instruct libcurl to not use any signal/alarm handlers, even when using
    # timeouts. This option is useful for multi-threaded applications.
    # See libcurl-the-guide for more background information.
    CURLOPT_NOSIGNAL = CURLOPTTYPE_LONG + 99
  
    # Provide a CURLShare for mutexing non-ts data
    # CURLOPT_SHARE = CURLOPTTYPE_OBJECTPOINT + 100
  
    # indicates type of proxy. accepted values are CURLPROXY_HTTP (default),
    # CURLPROXY_SOCKS4, CURLPROXY_SOCKS4A and CURLPROXY_SOCKS5.
    # CURLOPT_PROXYTYPE = CURLOPTTYPE_LONG + 101
  
    # Set the Accept-Encoding string. Use this to tell a server you would
    # like the response to be compressed.
    # CURLOPT_ENCODING = CURLOPTTYPE_OBJECTPOINT + 102
  
    # Set pointer to private data
    # CURLOPT_PRIVATE = CURLOPTTYPE_OBJECTPOINT + 103
  
    # Set aliases for HTTP 200 in the HTTP Response header
    # CURLOPT_HTTP200ALIASES = CURLOPTTYPE_OBJECTPOINT + 104
  
    # Continue to send authentication (user+password) when following 
    # locations, even when hostname changed. This can potentially send off
    # the name and password to whatever host the server decides.
    # CURLOPT_UNRESTRICTED_AUTH = CURLOPTTYPE_LONG + 105
  
    # Specifically switch on or off the FTP engine's use of the EPRT command
    # (it also disables the LPRT attempt). By default, those ones will always
    # be attempted before the good old traditional PORT command.
    # CURLOPT_FTP_USE_EPRT = CURLOPTTYPE_LONG + 106
  
    # Set this to a bitmask value to enable the particular authentications
    # methods you like. Use this in combination with CURLOPT_USERPWD.
    # Note that setting multiple bits may cause extra network round-trips.
    # CURLOPT_HTTPAUTH = CURLOPTTYPE_LONG + 107
  
    # Set the ssl context callback function, currently only for OpenSSL 
    # ssl_ctx in second argument. The function must be matching the
    # curl_ssl_ctx_callback proto.
    #CURLOPT_SSL_CTX_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 108
  
    # Set the userdata for the ssl context callback function's third
    # argument
    #CURLOPT_SSL_CTX_DATA = CURLOPTTYPE_OBJECTPOINT + 109
  
    # FTP Option that causes missing dirs to be created on the remote server.
    # In 7.19.4 we introduced the convenience enums for this option using the
    # CURLFTP_CREATE_DIR prefix.
    # CURLOPT_FTP_CREATE_MISSING_DIRS = CURLOPTTYPE_LONG + 110
  
    # Set this to a bitmask value to enable the particular authentications
    # methods you like. Use this in combination with CURLOPT_PROXYUSERPWD.
    # Note that setting multiple bits may cause extra network round-trips.
    # CURLOPT_PROXYAUTH = CURLOPTTYPE_LONG + 111
  
    # FTP option that changes the timeout, in seconds, associated with
    # getting a response.  This is different from transfer timeout time and
    # essentially places a demand on the FTP server to acknowledge commands
    # in a timely manner.
    # CURLOPT_FTP_RESPONSE_TIMEOUT = CURLOPTTYPE_LONG + 112
    # CURLOPT_SERVER_RESPONSE_TIMEOUT = CURLOPTTYPE_LONG + 112
  
    # Set this option to one of the CURL_IPRESOLVE_* defines (see below) to
    # tell libcurl to resolve names to those IP versions only. This only has
    # affect on systems with support for more than one, i.e IPv4 _and_ IPv6.
    # CURLOPT_IPRESOLVE = CURLOPTTYPE_LONG + 113
  
    # Set this option to limit the size of a file that will be downloaded
    # from an HTTP or FTP server.
  
    # Note there is also _LARGE version which adds large file support for
    # platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below.
    # CURLOPT_MAXFILESIZE = CURLOPTTYPE_LONG + 114
  
    # See the comment for INFILESIZE above, but in short,specifies
    # the size of the file being uploaded.  -1 means unknown.
    # CURLOPT_INFILESIZE_LARGE = CURLOPTTYPE_OFF_T + 115
  
    # Sets the continuation offset. There is also a LONG version of this;
    # look above for RESUME_FROM.
    # CURLOPT_RESUME_FROM_LARGE = CURLOPTTYPE_OFF_T + 116
  
    # Sets the maximum size of data that will be downloaded from
    # an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.
    # CURLOPT_MAXFILESIZE_LARGE = CURLOPTTYPE_OFF_T + 117
  
    # Set this option to the file name of your .netrc file you want libcurl
    # to parse (using the CURLOPT_NETRC option). If not set, libcurl will do
    # a poor attempt to find the user's home directory and check for a .netrc
    # file in there.
    # CURLOPT_NETRC_FILE = CURLOPTTYPE_OBJECTPOINT + 118
  
    # Enable SSL/TLS for FTP, pick oneof:
    #   CURLFTPSSL_TRY     - try using SSL, proceed anyway otherwise
    #   CURLFTPSSL_CONTROL - SSL for the control connection or fail
    #   CURLFTPSSL_ALL     - SSL for all communication or fail
    # CURLOPT_USE_SSL = CURLOPTTYPE_LONG + 119
  
    # The _LARGE version of the standard POSTFIELDSIZE option
    # CURLOPT_POSTFIELDSIZE_LARGE = CURLOPTTYPE_OFF_T + 120
  
    # Enable/disable the TCP Nagle algorithm
    # CURLOPT_TCP_NODELAY = CURLOPTTYPE_LONG + 121
  
    # 122 OBSOLETE, used in 7.12.3. Gone in 7.13.0
    # 123 OBSOLETE. Gone in 7.16.0
    # 124 OBSOLETE, used in 7.12.3. Gone in 7.13.0
    # 125 OBSOLETE, used in 7.12.3. Gone in 7.13.0
    # 126 OBSOLETE, used in 7.12.3. Gone in 7.13.0
    # 127 OBSOLETE. Gone in 7.16.0
    # 128 OBSOLETE. Gone in 7.16.0
  
    # When FTP over SSL/TLS is selected (with CURLOPT_USE_SSL), this option
    # can be used to change libcurl's default action which is to first try
    # "AUTH SSL" and then "AUTH TLS" in this order, and proceed when a OK
    # response has been received.
  
    # Available parameters are:
    #   CURLFTPAUTH_DEFAULT - let libcurl decide
    #   CURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
    #   CURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL
    # CURLOPT_FTPSSLAUTH = CURLOPTTYPE_LONG + 129
  
    # CURLOPT_IOCTLFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 130
    # CURLOPT_IOCTLDATA = CURLOPTTYPE_OBJECTPOINT + 131
  
    # 132 OBSOLETE. Gone in 7.16.0
    # 133 OBSOLETE. Gone in 7.16.0
  
    # zero terminated string for pass on to the FTP server when asked for
    # "account" info
    # CURLOPT_FTP_ACCOUNT = CURLOPTTYPE_OBJECTPOINT + 134
  
    # feed cookies into cookie engine
    CURLOPT_COOKIELIST = CURLOPTTYPE_OBJECTPOINT + 135
  
    # ignore Content-Length
    # CURLOPT_IGNORE_CONTENT_LENGTH = CURLOPTTYPE_LONG + 136
  
    # Set to non-zero to skip the IP address received in a 227 PASV FTP 
    # server response. Typically used for FTP-SSL purposes but is not
    # restricted to that. libcurl will then instead use the same IP address
    # it used for the control connection.
    # CURLOPT_FTP_SKIP_PASV_IP = CURLOPTTYPE_LONG + 137
  
    # Select "file method" to use when doing FTP, see thecurl_ftpmethod
    # above.
    # CURLOPT_FTP_FILEMETHOD = CURLOPTTYPE_LONG + 138
  
    # Local port number to bind the socket to
    # CURLOPT_LOCALPORT = CURLOPTTYPE_LONG + 139
  
    # Number of ports to try, including the first one set with LOCALPORT.
    # Thus, setting it to 1 will make no additional attempts but the first.
    # CURLOPT_LOCALPORTRANGE = CURLOPTTYPE_LONG + 140
  
    # no transfer, set up connection and let application use the socket by
    # extracting it with CURLINFO_LASTSOCKET
    # CURLOPT_CONNECT_ONLY = CURLOPTTYPE_LONG + 141
  
    # Function that will be called to convert from the
    # network encoding (instead of using the iconv calls in libcurl)
    # CURLOPT_CONV_FROM_NETWORK_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 142
  
    # Function that will be called to convert to the
    # network encoding (instead of using the iconv calls in libcurl)
    # CURLOPT_CONV_TO_NETWORK_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 143
  
    # Function that will be called to convert from UTF8
    # (instead of using the iconv calls in libcurl)
    # Note that this is used only for SSL certificate processing
    # CURLOPT_CONV_FROM_UTF8_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 144
  
    # if the connection proceeds too quickly then need to slow it down
    # limit-rate: maximum number of bytes per second to send or receive
    # CURLOPT_MAX_SEND_SPEED_LARGE = CURLOPTTYPE_OFF_T + 145
    # CURLOPT_MAX_RECV_SPEED_LARGE = CURLOPTTYPE_OFF_T + 146
  
    # Pointer to command string to send if USER/PASS fails.
    # CURLOPT_FTP_ALTERNATIVE_TO_USER = CURLOPTTYPE_OBJECTPOINT + 147
  
    # callback function for setting socket options
    # CURLOPT_SOCKOPTFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 148
    # CURLOPT_SOCKOPTDATA = CURLOPTTYPE_OBJECTPOINT + 149
  
    # set to 0 to disable session ID re-use for this transfer, default is
    # enabled (== 1)
    # CURLOPT_SSL_SESSIONID_CACHE = CURLOPTTYPE_LONG + 150
  
    # allowed SSH authentication methods
    # CURLOPT_SSH_AUTH_TYPES = CURLOPTTYPE_LONG + 151
  
    # Used by scp/sftp to do public/private key authentication
    # CURLOPT_SSH_PUBLIC_KEYFILE = CURLOPTTYPE_OBJECTPOINT + 152
    # CURLOPT_SSH_PRIVATE_KEYFILE = CURLOPTTYPE_OBJECTPOINT + 153
  
    # Send CCC (Clear Command Channel) after authentication
    # CURLOPT_FTP_SSL_CCC = CURLOPTTYPE_LONG + 154
  
    # Same as TIMEOUT and CONNECTTIMEOUT, but with ms resolution
    CURLOPT_TIMEOUT_MS = CURLOPTTYPE_LONG + 155
    CURLOPT_CONNECTTIMEOUT_MS = CURLOPTTYPE_LONG + 156
  
    # set to zero to disable the libcurl's decoding and thus pass the raw
    # body data to the application even when it is encoded/compressed
    # CURLOPT_HTTP_TRANSFER_DECODING = CURLOPTTYPE_LONG + 157
    # CURLOPT_HTTP_CONTENT_DECODING = CURLOPTTYPE_LONG + 158
  
    # Permission used when creating new files and directories on the remote
    # server for protocols that support it, SFTP/SCP/FILE
    # CURLOPT_NEW_FILE_PERMS = CURLOPTTYPE_LONG + 159
    # CURLOPT_NEW_DIRECTORY_PERMS = CURLOPTTYPE_LONG + 160
  
    # Set the behaviour of POST when redirecting. Values must be set to one
    # of CURL_REDIR* defines below. This used to be called CURLOPT_POST301
    # CURLOPT_POSTREDIR = CURLOPTTYPE_LONG + 161
  
    # used by scp/sftp to verify the host's public key
    # CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 = CURLOPTTYPE_OBJECTPOINT + 162
  
    # Callback function for opening socket (instead of socket(2)).Optionally,
    # callback is able change the address or refuse to connect returning
    # CURL_SOCKET_BAD.  The callback should have type
    # curl_opensocket_callback
    # CURLOPT_OPENSOCKETFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 163
    # CURLOPT_OPENSOCKETDATA = CURLOPTTYPE_OBJECTPOINT + 164
  
    # POST volatile input fields.
    # CURLOPT_COPYPOSTFIELDS = CURLOPTTYPE_OBJECTPOINT + 165
  
    # set transfer mode (;type=<a|i>) when doing FTP via an HTTP proxy
    # CURLOPT_PROXY_TRANSFER_MODE = CURLOPTTYPE_LONG + 166
  
    # Callback function for seeking in the input stream
    # CURLOPT_SEEKFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 167
    # CURLOPT_SEEKDATA = CURLOPTTYPE_OBJECTPOINT + 168
  
    # CRL file
    # CURLOPT_CRLFILE = CURLOPTTYPE_OBJECTPOINT + 169
  
    # Issuer certificate
    # CURLOPT_ISSUERCERT = CURLOPTTYPE_OBJECTPOINT + 170
  
    # (IPv6) Address scope
    # CURLOPT_ADDRESS_SCOPE = CURLOPTTYPE_LONG + 171
  
    # Collect certificate chain info and allow it to get retrievable with
    # CURLINFO_CERTINFO after the transfer is complete. (Unfortunately) only
    # working with OpenSSL-powered builds.
    # CURLOPT_CERTINFO = CURLOPTTYPE_LONG + 172
  
    # "name" and "pwd" to use when fetching.
    # CURLOPT_USERNAME = CURLOPTTYPE_OBJECTPOINT + 173
    # CURLOPT_PASSWORD = CURLOPTTYPE_OBJECTPOINT + 174
  
    # "name" and "pwd" to use with Proxy when fetching.
    # CURLOPT_PROXYUSERNAME = CURLOPTTYPE_OBJECTPOINT + 175
    # CURLOPT_PROXYPASSWORD = CURLOPTTYPE_OBJECTPOINT + 176
  
    # Comma separated list of hostnames defining no-proxy zones. These should
    # match both hostnames directly, and hostnames within a domain. For
    # example, local.com will match local.com and www.local.com, but NOT
    # notlocal.com or www.notlocal.com. For compatibility with other
    # implementations of this, .local.com will be considered to be the 
    # same as local.com. A single# is the only valid wildcard, andeffectively
    # disables the use of proxy.
    # CURLOPT_NOPROXY = CURLOPTTYPE_OBJECTPOINT + 177
  
    # block size for TFTP transfers
    # CURLOPT_TFTP_BLKSIZE = CURLOPTTYPE_LONG + 178
  
    # Socks Service
    # CURLOPT_SOCKS5_GSSAPI_SERVICE = CURLOPTTYPE_OBJECTPOINT + 179
  
    # Socks Service
    # CURLOPT_SOCKS5_GSSAPI_NEC = CURLOPTTYPE_LONG + 180
  
    # set the bitmask for the protocols that are allowed to be used for the
    # transfer, which thus helps the app which takes URLs from users or other
    # external inputs and want to restrict what protocol(s) to deal
    # with. Defaults to CURLPROTO_ALL.
    CURLOPT_PROTOCOLS = CURLOPTTYPE_LONG + 181
  
    # set the bitmask for the protocols that libcurl is allowed to follow to,
    # as a subset of the CURLOPT_PROTOCOLS ones. That means the protocol
    # needs to be set in both bitmasks to be allowed to get redirected to.
    # Defaults to all protocols except FILE and SCP.
    # CURLOPT_REDIR_PROTOCOLS = CURLOPTTYPE_LONG + 182
  
    # set the SSH knownhost file name to use
    # CURLOPT_SSH_KNOWNHOSTS = CURLOPTTYPE_OBJECTPOINT + 183
  
    # set the SSH host key callback, must point to a curl_sshkeycallback
    # function
    # CURLOPT_SSH_KEYFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 184
  
    # set the SSH host key callback custom pointer
    # CURLOPT_SSH_KEYDATA = CURLOPTTYPE_OBJECTPOINT + 185
  
    # set the SMTP mail originator
    # CURLOPT_MAIL_FROM = CURLOPTTYPE_OBJECTPOINT + 186
  
    # set the SMTP mail receiver(s)
    # CURLOPT_MAIL_RCPT = CURLOPTTYPE_OBJECTPOINT + 187
  
    # FTP: send PRET before PASV
    # CURLOPT_FTP_USE_PRET = CURLOPTTYPE_LONG + 188
  
    # RTSP request method (OPTIONS, SETUP, PLAY, etc...)
    # CURLOPT_RTSP_REQUEST = CURLOPTTYPE_LONG + 189
  
    # The RTSP session identifier
    # CURLOPT_RTSP_SESSION_ID = CURLOPTTYPE_OBJECTPOINT + 190
  
    # The RTSP stream URI
    # CURLOPT_RTSP_STREAM_URI = CURLOPTTYPE_OBJECTPOINT + 191
  
    # The Transport: header to use in RTSP requests
    # CURLOPT_RTSP_TRANSPORT = CURLOPTTYPE_OBJECTPOINT + 192
  
    # Manually initialize the client RTSP CSeq for this handle
    # CURLOPT_RTSP_CLIENT_CSEQ = CURLOPTTYPE_LONG + 193
  
    # Manually initialize the server RTSP CSeq for this handle
    # CURLOPT_RTSP_SERVER_CSEQ = CURLOPTTYPE_LONG + 194
  
    # The stream to pass to INTERLEAVEFUNCTION.
    # CURLOPT_INTERLEAVEDATA = CURLOPTTYPE_OBJECTPOINT + 195
  
    # Let the application define a custom write method for RTP data
    # CURLOPT_INTERLEAVEFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 196

    private

    def set_option(option, value)
      if (0    ..10000).include?(option) and not value.class == Fixnum \
      or (10000..20000).include?(option) and not value.class == String
        raise ArgumentError, "invalid option value class => '#{value.class}'"
      end
  
      case option
      when 0 .. 10000
        easy_setopt_long(option, value)
      when 10000 .. 20000
        easy_setopt_string(option, value)
      end   
    end

  end
end
