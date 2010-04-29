module RubyCurl

  CURLINFO_STRING   = 0x100000
  CURLINFO_LONG     = 0x200000
  CURLINFO_DOUBLE   = 0x300000
  CURLINFO_SLIST    = 0x400000
  CURLINFO_MASK     = 0x0fffff
  CURLINFO_TYPEMASK = 0xf00000

  class Easy
    module Info

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
  
      METHOD_MAP = {
        :effective_url           => CURLINFO_EFFECTIVE_URL,
        :response_code           => CURLINFO_RESPONSE_CODE,
        :total_time              => CURLINFO_TOTAL_TIME,
        :name_lookup_time        => CURLINFO_NAMELOOKUP_TIME,
        :connect_time            => CURLINFO_CONNECT_TIME,
        :pretransfer_time        => CURLINFO_PRETRANSFER_TIME,
        :upload_size             => CURLINFO_SIZE_UPLOAD,
        :download_size           => CURLINFO_SIZE_DOWNLOAD,
        :upload_speed            => CURLINFO_SPEED_UPLOAD,
        :download_speed          => CURLINFO_SPEED_DOWNLOAD,
        :header_size             => CURLINFO_HEADER_SIZE,
        :request_size            => CURLINFO_REQUEST_SIZE,
        :ssl_verify_result       => CURLINFO_SSL_VERIFYRESULT,
        :filetime                => CURLINFO_FILETIME,
        :content_length_download => CURLINFO_CONTENT_LENGTH_DOWNLOAD,
        :content_length_upload   => CURLINFO_CONTENT_LENGTH_UPLOAD,
        :start_transfer_time     => CURLINFO_STARTTRANSFER_TIME,
        :content_type            => CURLINFO_CONTENT_TYPE,
        :redirect_time           => CURLINFO_REDIRECT_TIME,
        :redirect_count          => CURLINFO_REDIRECT_COUNT,
        :http_connect_code       => CURLINFO_HTTP_CONNECTCODE,
        :http_auth_avail         => CURLINFO_HTTPAUTH_AVAIL,
        :proxy_auth_avail        => CURLINFO_PROXYAUTH_AVAIL,
        :os_errno                => CURLINFO_OS_ERRNO,
        :num_connects            => CURLINFO_NUM_CONNECTS,
        :ssl_engines             => CURLINFO_SSL_ENGINES,
        :cookie_list             => CURLINFO_COOKIELIST,
        :last_socket             => CURLINFO_LASTSOCKET,
        :ftp_entry_path          => CURLINFO_FTP_ENTRY_PATH,
        :redirect_url            => CURLINFO_REDIRECT_URL,
        :primary_ip              => CURLINFO_PRIMARY_IP,
        :app_connect_time        => CURLINFO_APPCONNECT_TIME,
        :cert_info               => CURLINFO_CERTINFO,
        :condition_unmet         => CURLINFO_CONDITION_UNMET,
        :rtsp_session_id         => CURLINFO_RTSP_SESSION_ID,
        :rtsp_client_cseq        => CURLINFO_RTSP_CLIENT_CSEQ,
        :rtsp_server_cseq        => CURLINFO_RTSP_SERVER_CSEQ,
        :rtsp_cseq_recv          => CURLINFO_RTSP_CSEQ_RECV
      }

      METHOD_MAP.each do |method, flag|
        define_method(method) { get_info(flag) }
      end

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
end
