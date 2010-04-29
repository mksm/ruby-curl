module RubyCurl

  CURLOPTTYPE_LONG          = 0
  CURLOPTTYPE_OBJECTPOINT   = 10000
  CURLOPTTYPE_FUNCTIONPOINT = 20000

  class Easy
    module Options

      CURLOPT_URL                          = CURLOPTTYPE_OBJECTPOINT   + 2  
      # CURLOPT_PORT                       = CURLOPTTYPE_LONG          + 3
      # CURLOPT_PROXY                      = CURLOPTTYPE_OBJECTPOINT   + 4
      # CURLOPT_USERPWD                    = CURLOPTTYPE_OBJECTPOINT   + 5
      # CURLOPT_PROXYUSERPWD               = CURLOPTTYPE_OBJECTPOINT   + 6
      # CURLOPT_RANGE                      = CURLOPTTYPE_OBJECTPOINT   + 7
      # CURLOPT_INFILE                     = CURLOPTTYPE_OBJECTPOINT   + 9
      # CURLOPT_ERRORBUFFER                = CURLOPTTYPE_OBJECTPOINT   + 10
      # CURLOPT_WRITEFUNCTION              = CURLOPTTYPE_FUNCTIONPOINT + 11
      # CURLOPT_READFUNCTION               = CURLOPTTYPE_FUNCTIONPOINT + 12
      # CURLOPT_TIMEOUT                    = CURLOPTTYPE_LONG          + 13
      # CURLOPT_INFILESIZE                 = CURLOPTTYPE_LONG          + 14
      CURLOPT_POSTFIELDS                   = CURLOPTTYPE_OBJECTPOINT   + 15
      # CURLOPT_REFERER                    = CURLOPTTYPE_OBJECTPOINT   + 16
      # CURLOPT_FTPPORT                    = CURLOPTTYPE_OBJECTPOINT   + 17
      # CURLOPT_USERAGENT                  = CURLOPTTYPE_OBJECTPOINT   + 18
      # CURLOPT_LOW_SPEED_LIMIT            = CURLOPTTYPE_LONG          + 19
      # CURLOPT_LOW_SPEED_TIME             = CURLOPTTYPE_LONG          + 20
      # CURLOPT_RESUME_FROM                = CURLOPTTYPE_LONG          + 21
      # CURLOPT_COOKIE                     = CURLOPTTYPE_OBJECTPOINT   + 22
      CURLOPT_HTTPHEADER                   = CURLOPTTYPE_OBJECTPOINT   + 23
      # CURLOPT_HTTPPOST                   = CURLOPTTYPE_OBJECTPOINT   + 24
      # CURLOPT_SSLCERT                    = CURLOPTTYPE_OBJECTPOINT   + 25
      # CURLOPT_KEYPASSWD                  = CURLOPTTYPE_OBJECTPOINT   + 26
      # CURLOPT_CRLF                       = CURLOPTTYPE_LONG          + 27
      # CURLOPT_QUOTE                      = CURLOPTTYPE_OBJECTPOINT   + 28
      # CURLOPT_WRITEHEADER                = CURLOPTTYPE_OBJECTPOINT   + 29
      # CURLOPT_COOKIEFILE                 = CURLOPTTYPE_OBJECTPOINT   + 31
      # CURLOPT_SSLVERSION                 = CURLOPTTYPE_LONG          + 32
      # CURLOPT_TIMECONDITION              = CURLOPTTYPE_LONG          + 33
      # CURLOPT_TIMEVALUE                  = CURLOPTTYPE_LONG          + 34
      # CURLOPT_CUSTOMREQUEST              = CURLOPTTYPE_OBJECTPOINT   + 36
      # CURLOPT_STDERR                     = CURLOPTTYPE_OBJECTPOINT   + 37
      # CURLOPT_POSTQUOTE                  = CURLOPTTYPE_OBJECTPOINT   + 39
      # CURLOPT_WRITEINFO                  = CURLOPTTYPE_OBJECTPOINT   + 40
      CURLOPT_VERBOSE                      = CURLOPTTYPE_LONG          + 41
      # CURLOPT_HEADER                     = CURLOPTTYPE_LONG          + 42
      # CURLOPT_NOPROGRESS                 = CURLOPTTYPE_LONG          + 43
      CURLOPT_NOBODY                       = CURLOPTTYPE_LONG          + 44
      # CURLOPT_FAILONERROR                = CURLOPTTYPE_LONG          + 45
      # CURLOPT_UPLOAD                     = CURLOPTTYPE_LONG          + 46
      CURLOPT_POST                         = CURLOPTTYPE_LONG          + 47
      # CURLOPT_DIRLISTONLY                = CURLOPTTYPE_LONG          + 48
      # CURLOPT_APPEND                     = CURLOPTTYPE_LONG          + 50
      # CURLOPT_NETRC                      = CURLOPTTYPE_LONG          + 51
      CURLOPT_FOLLOWLOCATION               = CURLOPTTYPE_LONG          + 52
      # CURLOPT_TRANSFERTEXT               = CURLOPTTYPE_LONG          + 53
      # CURLOPT_PUT                        = CURLOPTTYPE_LONG          + 54
      # CURLOPT_PROGRESSFUNCTION           = CURLOPTTYPE_FUNCTIONPOINT + 56
      # CURLOPT_PROGRESSDATA               = CURLOPTTYPE_OBJECTPOINT   + 57
      CURLOPT_AUTOREFERER                  = CURLOPTTYPE_LONG          + 58
      # CURLOPT_PROXYPORT                  = CURLOPTTYPE_LONG          + 59
      # CURLOPT_POSTFIELDSIZE              = CURLOPTTYPE_LONG          + 60
      # CURLOPT_HTTPPROXYTUNNEL            = CURLOPTTYPE_LONG          + 61
      CURLOPT_INTERFACE                    = CURLOPTTYPE_OBJECTPOINT   + 62
      # CURLOPT_KRBLEVEL                   = CURLOPTTYPE_OBJECTPOINT   + 63
      # CURLOPT_SSL_VERIFYPEER             = CURLOPTTYPE_LONG          + 64
      # CURLOPT_CAINFO                     = CURLOPTTYPE_OBJECTPOINT   + 65
      CURLOPT_MAXREDIRS                    = CURLOPTTYPE_LONG          + 68
      # CURLOPT_FILETIME                   = CURLOPTTYPE_LONG          + 69
      # CURLOPT_TELNETOPTIONS              = CURLOPTTYPE_OBJECTPOINT   + 70
      # CURLOPT_MAXCONNECTS                = CURLOPTTYPE_LONG          + 71
      # CURLOPT_CLOSEPOLICY                = CURLOPTTYPE_LONG          + 72
      # CURLOPT_FRESH_CONNECT              = CURLOPTTYPE_LONG          + 74
      # CURLOPT_FORBID_REUSE               = CURLOPTTYPE_LONG          + 75
      # CURLOPT_RANDOM_FILE                = CURLOPTTYPE_OBJECTPOINT   + 76
      # CURLOPT_EGDSOCKET                  = CURLOPTTYPE_OBJECTPOINT   + 77
      # CURLOPT_CONNECTTIMEOUT             = CURLOPTTYPE_LONG          + 78
      # CURLOPT_HEADERFUNCTION             = CURLOPTTYPE_FUNCTIONPOINT + 79
      CURLOPT_HTTPGET                      = CURLOPTTYPE_LONG          + 80
      # CURLOPT_SSL_VERIFYHOST             = CURLOPTTYPE_LONG          + 81
      # CURLOPT_COOKIEJAR                  = CURLOPTTYPE_OBJECTPOINT   + 82
      # CURLOPT_SSL_CIPHER_LIST            = CURLOPTTYPE_OBJECTPOINT   + 83
      # CURLOPT_HTTP_VERSION               = CURLOPTTYPE_LONG          + 84
      # CURLOPT_FTP_USE_EPSV               = CURLOPTTYPE_LONG          + 85
      # CURLOPT_SSLCERTTYPE                = CURLOPTTYPE_OBJECTPOINT   + 86
      # CURLOPT_SSLKEY                     = CURLOPTTYPE_OBJECTPOINT   + 87
      # CURLOPT_SSLKEYTYPE                 = CURLOPTTYPE_OBJECTPOINT   + 88
      # CURLOPT_SSLENGINE                  = CURLOPTTYPE_OBJECTPOINT   + 89
      # CURLOPT_SSLENGINE_DEFAULT          = CURLOPTTYPE_LONG          + 90
      # CURLOPT_DNS_USE_GLOBAL_CACHE       = CURLOPTTYPE_LONG          + 91 
      CURLOPT_DNS_CACHE_TIMEOUT            = CURLOPTTYPE_LONG          + 92
      # CURLOPT_PREQUOTE                   = CURLOPTTYPE_OBJECTPOINT   + 93
      # CURLOPT_DEBUGFUNCTION              = CURLOPTTYPE_FUNCTIONPOINT + 94
      # CURLOPT_DEBUGDATA                  = CURLOPTTYPE_OBJECTPOINT   + 95
      # CURLOPT_COOKIESESSION              = CURLOPTTYPE_LONG          + 96
      # CURLOPT_CAPATH                     = CURLOPTTYPE_OBJECTPOINT   + 97
      # CURLOPT_BUFFERSIZE                 = CURLOPTTYPE_LONG          + 98
      CURLOPT_NOSIGNAL                     = CURLOPTTYPE_LONG          + 99
      # CURLOPT_SHARE                      = CURLOPTTYPE_OBJECTPOINT   + 100
      # CURLOPT_PROXYTYPE                  = CURLOPTTYPE_LONG          + 101
      # CURLOPT_ENCODING                   = CURLOPTTYPE_OBJECTPOINT   + 102
      # CURLOPT_PRIVATE                    = CURLOPTTYPE_OBJECTPOINT   + 103
      # CURLOPT_HTTP200ALIASES             = CURLOPTTYPE_OBJECTPOINT   + 104
      # CURLOPT_UNRESTRICTED_AUTH          = CURLOPTTYPE_LONG          + 105
      # CURLOPT_FTP_USE_EPRT               = CURLOPTTYPE_LONG          + 106
      # CURLOPT_HTTPAUTH                   = CURLOPTTYPE_LONG          + 107
      # CURLOPT_SSL_CTX_FUNCTION           = CURLOPTTYPE_FUNCTIONPOINT + 108
      # CURLOPT_SSL_CTX_DATA               = CURLOPTTYPE_OBJECTPOINT   + 109
      # CURLOPT_FTP_CREATE_MISSING_DIRS    = CURLOPTTYPE_LONG          + 110
      # CURLOPT_PROXYAUTH                  = CURLOPTTYPE_LONG          + 111
      # CURLOPT_FTP_RESPONSE_TIMEOUT       = CURLOPTTYPE_LONG          + 112
      # CURLOPT_SERVER_RESPONSE_TIMEOUT    = CURLOPTTYPE_LONG          + 112
      # CURLOPT_IPRESOLVE                  = CURLOPTTYPE_LONG          + 113
      # CURLOPT_MAXFILESIZE                = CURLOPTTYPE_LONG          + 114
      # CURLOPT_INFILESIZE_LARGE           = CURLOPTTYPE_OFF_T         + 115
      # CURLOPT_RESUME_FROM_LARGE          = CURLOPTTYPE_OFF_T         + 116
      # CURLOPT_MAXFILESIZE_LARGE          = CURLOPTTYPE_OFF_T         + 117
      # CURLOPT_NETRC_FILE                 = CURLOPTTYPE_OBJECTPOINT   + 118
      # CURLOPT_USE_SSL                    = CURLOPTTYPE_LONG          + 119
      # CURLOPT_POSTFIELDSIZE_LARGE        = CURLOPTTYPE_OFF_T         + 120
      # CURLOPT_TCP_NODELAY                = CURLOPTTYPE_LONG          + 121
      # CURLOPT_FTPSSLAUTH                 = CURLOPTTYPE_LONG          + 129
      # CURLOPT_IOCTLFUNCTION              = CURLOPTTYPE_FUNCTIONPOINT + 130
      # CURLOPT_IOCTLDATA                  = CURLOPTTYPE_OBJECTPOINT   + 131
      # CURLOPT_FTP_ACCOUNT                = CURLOPTTYPE_OBJECTPOINT   + 134
      # CURLOPT_COOKIELIST                 = CURLOPTTYPE_OBJECTPOINT   + 135
      # CURLOPT_IGNORE_CONTENT_LENGTH      = CURLOPTTYPE_LONG          + 136
      # CURLOPT_FTP_SKIP_PASV_IP           = CURLOPTTYPE_LONG          + 137
      # CURLOPT_FTP_FILEMETHOD             = CURLOPTTYPE_LONG          + 138
      # CURLOPT_LOCALPORT                  = CURLOPTTYPE_LONG          + 139
      # CURLOPT_LOCALPORTRANGE             = CURLOPTTYPE_LONG          + 140
      # CURLOPT_CONNECT_ONLY               = CURLOPTTYPE_LONG          + 141
      # CURLOPT_CONV_FROM_NETWORK_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 142
      # CURLOPT_CONV_TO_NETWORK_FUNCTION   = CURLOPTTYPE_FUNCTIONPOINT + 143
      # CURLOPT_CONV_FROM_UTF8_FUNCTION    = CURLOPTTYPE_FUNCTIONPOINT + 144
      # CURLOPT_MAX_SEND_SPEED_LARGE       = CURLOPTTYPE_OFF_T         + 145
      # CURLOPT_MAX_RECV_SPEED_LARGE       = CURLOPTTYPE_OFF_T         + 146
      # CURLOPT_FTP_ALTERNATIVE_TO_USER    = CURLOPTTYPE_OBJECTPOINT   + 147
      # CURLOPT_SOCKOPTFUNCTION            = CURLOPTTYPE_FUNCTIONPOINT + 148
      # CURLOPT_SOCKOPTDATA                = CURLOPTTYPE_OBJECTPOINT   + 149
      # CURLOPT_SSL_SESSIONID_CACHE        = CURLOPTTYPE_LONG          + 150
      # CURLOPT_SSH_AUTH_TYPES             = CURLOPTTYPE_LONG          + 151
      # CURLOPT_SSH_PUBLIC_KEYFILE         = CURLOPTTYPE_OBJECTPOINT   + 152
      # CURLOPT_SSH_PRIVATE_KEYFILE        = CURLOPTTYPE_OBJECTPOINT   + 153
      # CURLOPT_FTP_SSL_CCC                = CURLOPTTYPE_LONG          + 154
      CURLOPT_TIMEOUT_MS                   = CURLOPTTYPE_LONG          + 155
      CURLOPT_CONNECTTIMEOUT_MS            = CURLOPTTYPE_LONG          + 156
      # CURLOPT_HTTP_TRANSFER_DECODING     = CURLOPTTYPE_LONG          + 157
      # CURLOPT_HTTP_CONTENT_DECODING      = CURLOPTTYPE_LONG          + 158
      # CURLOPT_NEW_FILE_PERMS             = CURLOPTTYPE_LONG          + 159
      # CURLOPT_NEW_DIRECTORY_PERMS        = CURLOPTTYPE_LONG          + 160
      # CURLOPT_POSTREDIR                  = CURLOPTTYPE_LONG          + 161
      # CURLOPT_SSH_HOST_PUBLIC_KEY_MD5    = CURLOPTTYPE_OBJECTPOINT   + 162
      # CURLOPT_OPENSOCKETFUNCTION         = CURLOPTTYPE_FUNCTIONPOINT + 163
      # CURLOPT_OPENSOCKETDATA             = CURLOPTTYPE_OBJECTPOINT   + 164
      # CURLOPT_COPYPOSTFIELDS             = CURLOPTTYPE_OBJECTPOINT   + 165
      # CURLOPT_PROXY_TRANSFER_MODE        = CURLOPTTYPE_LONG          + 166
      # CURLOPT_SEEKFUNCTION               = CURLOPTTYPE_FUNCTIONPOINT + 167
      # CURLOPT_SEEKDATA                   = CURLOPTTYPE_OBJECTPOINT   + 168
      # CURLOPT_CRLFILE                    = CURLOPTTYPE_OBJECTPOINT   + 169
      # CURLOPT_ISSUERCERT                 = CURLOPTTYPE_OBJECTPOINT   + 170
      # CURLOPT_ADDRESS_SCOPE              = CURLOPTTYPE_LONG          + 171
      # CURLOPT_CERTINFO                   = CURLOPTTYPE_LONG          + 172
      # CURLOPT_USERNAME                   = CURLOPTTYPE_OBJECTPOINT   + 173
      # CURLOPT_PASSWORD                   = CURLOPTTYPE_OBJECTPOINT   + 174
      # CURLOPT_PROXYUSERNAME              = CURLOPTTYPE_OBJECTPOINT   + 175
      # CURLOPT_PROXYPASSWORD              = CURLOPTTYPE_OBJECTPOINT   + 176
      # CURLOPT_NOPROXY                    = CURLOPTTYPE_OBJECTPOINT   + 177
      # CURLOPT_TFTP_BLKSIZE               = CURLOPTTYPE_LONG          + 178
      # CURLOPT_SOCKS5_GSSAPI_SERVICE      = CURLOPTTYPE_OBJECTPOINT   + 179
      # CURLOPT_SOCKS5_GSSAPI_NEC          = CURLOPTTYPE_LONG          + 180
      # CURLOPT_PROTOCOLS                  = CURLOPTTYPE_LONG          + 181
      # CURLOPT_REDIR_PROTOCOLS            = CURLOPTTYPE_LONG          + 182
      # CURLOPT_SSH_KNOWNHOSTS             = CURLOPTTYPE_OBJECTPOINT   + 183
      # CURLOPT_SSH_KEYFUNCTION            = CURLOPTTYPE_FUNCTIONPOINT + 184
      # CURLOPT_SSH_KEYDATA                = CURLOPTTYPE_OBJECTPOINT   + 185
      # CURLOPT_MAIL_FROM                  = CURLOPTTYPE_OBJECTPOINT   + 186
      # CURLOPT_MAIL_RCPT                  = CURLOPTTYPE_OBJECTPOINT   + 187
      # CURLOPT_FTP_USE_PRET               = CURLOPTTYPE_LONG          + 188
      # CURLOPT_RTSP_REQUEST               = CURLOPTTYPE_LONG          + 189
      # CURLOPT_RTSP_SESSION_ID            = CURLOPTTYPE_OBJECTPOINT   + 190
      # CURLOPT_RTSP_STREAM_URI            = CURLOPTTYPE_OBJECTPOINT   + 191
      # CURLOPT_RTSP_TRANSPORT             = CURLOPTTYPE_OBJECTPOINT   + 192
      # CURLOPT_RTSP_CLIENT_CSEQ           = CURLOPTTYPE_LONG          + 193
      # CURLOPT_RTSP_SERVER_CSEQ           = CURLOPTTYPE_LONG          + 194
      # CURLOPT_INTERLEAVEDATA             = CURLOPTTYPE_OBJECTPOINT   + 195
      # CURLOPT_INTERLEAVEFUNCTION         = CURLOPTTYPE_FUNCTIONPOINT + 196
  
      METHOD_MAP = {
        :url                => CURLOPT_URL,
        :post_fields        => CURLOPT_POSTFIELDS,
        :auto_referer       => CURLOPT_AUTOREFERER,
        :verbose            => CURLOPT_VERBOSE,
        :follow_location    => CURLOPT_FOLLOWLOCATION,
        :max_redirects      => CURLOPT_MAXREDIRS,
        :read_timeouts_ms   => CURLOPT_TIMEOUT_MS,
        :connect_timeout_ms => CURLOPT_CONNECTTIMEOUT_MS,
        :dns_cache_timeout  => CURLOPT_DNS_CACHE_TIMEOUT,
        :no_signal          => CURLOPT_NOSIGNAL,
        :interface          => CURLOPT_INTERFACE
      }
  
      METHOD_MAP.each do |method, flag|
        # attribute reader
        define_method(method) { instance_variable_get("@#{method}") }
        # attribute writer
        define_method("#{method}=") do |value|
           set_option(flag, value)
           instance_variable_set("@#{method}", value)
        end
      end
  
      private
  
      def set_option(option, value)
        if (0    ..10000).include?(option) and not value.class == Fixnum \
        or (10000..20000).include?(option) and not value.class == String \
        or not option
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


  class Multi
    module Options

      # CURLMOPT_SOCKETFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 1
      # CURLMOPT_SOCKETDATA     = CURLOPTTYPE_OBJECTPOINT   + 2
      CURLMOPT_PIPELINING       = CURLOPTTYPE_LONG          + 3
      # CURLMOPT_TIMERFUNCTION  = CURLOPTTYPE_FUNCTIONPOINT + 4
      # CURLMOPT_TIMERDATA      = CURLOPTTYPE_OBJECTPOINT   + 5
      CURLMOPT_MAXCONNECTS      = CURLOPTTYPE_LONG          + 6

      METHOD_MAP = {
        :pipelining   => CURLMOPT_PIPELINING,
        :max_connects => CURLMOPT_MAXCONNECTS
      }

      METHOD_MAP.each do |method, flag|
        # attribute reader
        define_method(method) { instance_variable_get("@#{method}") }
        # attribute writer
        define_method("#{method}=") do |value|
           set_option(flag, value)
           instance_variable_set("@#{method}", value)
        end
      end

      private

      def set_option(option, value)
        if (0..10000).include?(option) and value.class == Fixnum
          multi_setopt_long(option, value)
        else
          raise ArgumentError, "invalid option/value pair"
        end
      end
    end
 
  end
end
