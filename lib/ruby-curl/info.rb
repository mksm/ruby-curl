module RubyCurl

  CURLINFO_STRING   = 0x100000
  CURLINFO_LONG     = 0x200000
  CURLINFO_DOUBLE   = 0x300000
  CURLINFO_SLIST    = 0x400000
  CURLINFO_MASK     = 0x0fffff
  CURLINFO_TYPEMASK = 0xf00000

  class Easy

    CURLINFO_EFFECTIVE_URL           = CURLINFO_STRING + 1
    CURLINFO_RESPONSE_CODE           = CURLINFO_LONG   + 2
    CURLINFO_TOTAL_TIME              = CURLINFO_DOUBLE + 3
    CURLINFO_NAMELOOKUP_TIME         = CURLINFO_DOUBLE + 4
    CURLINFO_CONNECT_TIME            = CURLINFO_DOUBLE + 5
    CURLINFO_PRETRANSFER_TIME        = CURLINFO_DOUBLE + 6
    CURLINFO_SIZE_UPLOAD             = CURLINFO_DOUBLE + 7
    CURLINFO_SIZE_DOWNLOAD           = CURLINFO_DOUBLE + 8
    CURLINFO_SPEED_DOWNLOAD          = CURLINFO_DOUBLE + 9
    CURLINFO_SPEED_UPLOAD            = CURLINFO_DOUBLE + 10
    CURLINFO_HEADER_SIZE             = CURLINFO_LONG   + 11
    CURLINFO_REQUEST_SIZE            = CURLINFO_LONG   + 12
    CURLINFO_SSL_VERIFYRESULT        = CURLINFO_LONG   + 13
    CURLINFO_FILETIME                = CURLINFO_LONG   + 14
    CURLINFO_CONTENT_LENGTH_DOWNLOAD = CURLINFO_DOUBLE + 15
    CURLINFO_CONTENT_LENGTH_UPLOAD   = CURLINFO_DOUBLE + 16
    CURLINFO_STARTTRANSFER_TIME      = CURLINFO_DOUBLE + 17
    CURLINFO_CONTENT_TYPE            = CURLINFO_STRING + 18
    CURLINFO_REDIRECT_TIME           = CURLINFO_DOUBLE + 19
    CURLINFO_REDIRECT_COUNT          = CURLINFO_LONG   + 20
    CURLINFO_PRIVATE                 = CURLINFO_STRING + 21
    CURLINFO_HTTP_CONNECTCODE        = CURLINFO_LONG   + 22
    CURLINFO_HTTPAUTH_AVAIL          = CURLINFO_LONG   + 23
    CURLINFO_PROXYAUTH_AVAIL         = CURLINFO_LONG   + 24
    CURLINFO_OS_ERRNO                = CURLINFO_LONG   + 25
    CURLINFO_NUM_CONNECTS            = CURLINFO_LONG   + 26
    CURLINFO_SSL_ENGINES             = CURLINFO_SLIST  + 27
    CURLINFO_COOKIELIST              = CURLINFO_SLIST  + 28
    CURLINFO_LASTSOCKET              = CURLINFO_LONG   + 29
    CURLINFO_FTP_ENTRY_PATH          = CURLINFO_STRING + 30
    CURLINFO_REDIRECT_URL            = CURLINFO_STRING + 31
    CURLINFO_PRIMARY_IP              = CURLINFO_STRING + 32
    CURLINFO_APPCONNECT_TIME         = CURLINFO_DOUBLE + 33
    CURLINFO_CERTINFO                = CURLINFO_SLIST  + 34
    CURLINFO_CONDITION_UNMET         = CURLINFO_LONG   + 35
    CURLINFO_RTSP_SESSION_ID         = CURLINFO_STRING + 36
    CURLINFO_RTSP_CLIENT_CSEQ        = CURLINFO_LONG   + 37
    CURLINFO_RTSP_SERVER_CSEQ        = CURLINFO_LONG   + 38
    CURLINFO_RTSP_CSEQ_RECV          = CURLINFO_LONG   + 39

    private

    def get_info(flag)
      case flag
      when CURLINFO_STRING..CURLINFO_LONG
        easy_getinfo_string(flag)
      when CURLINFO_LONG..CURLINFO_DOUBLE
        easy_getinfo_long(flag)
      when CURLINFO_DOUBLE..CURLINFO_SLIST
        easy_getinfo_double(flag)
      end 
    end

  end
end
