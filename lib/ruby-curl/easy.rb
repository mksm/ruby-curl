module RubyCurl
  class Easy

    INFO_METHODS = {
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

    attr_reader :url,               :method,          :params,        
                :auto_referer,      :verbose,         :follow_location,
                :max_redirects,     :read_timeout_ms, :connect_timeout_ms,
                :dns_cache_timeout, :interface

    attr_reader :body_str, :header_str

    def initialize(arg_url = nil, arg_method = nil, arg_params = {})
      url                 = arg_url
      method              = arg_method
      params              = arg_params
      @headers            = {}
      @auto_referer       = false
      @verbose            = false
      @follow_location    = false
      @max_redirects      = false
      @read_timeout_ms    = 0
      @connect_timeout_ms = 0
      @dns_cache_timeout  = 60
      @interface          = nil
      self
    end

    def method_missing(method)
      if INFO_METHODS[method]
        get_info(INFO_METHODS[method])
      else
        super
      end
    end

    def methods
      super + INFO_METHODS.keys.map(&:to_s)
    end

    def url=(url)
      set_option(CURLOPT_URL, url)
      @url = url
    end

    def method=(method)
      case method
      when :get
        set_option(CURLOPT_HTTPGET, 1)
      when :post
        # CURLOPT_POSTFIELDS sets CURLOPT_POST automatically.
        # But we'll do it anyways.
        set_option(CURLOPT_POST, 1)
      else
        raise ArgumentError, "invalid/not supported method => '#{@method}'"
      end
      @method = method
    end

    def params=(params)
      case @method
      when :get
        url = "#{@url}?#{params_string(params)}"
      when :post
        # No need to set CURLOPT_POSTFIELDSIZE. libcurl uses strlen().
        set_option(CURLOPT_POSTFIELDS, params_string(params))
      else
        raise ArgumentError, "invalid/not supported method => '#{@method}'"
      end
      @params = params
    end

    def set_headers
      @headers.each { |k, v| easy_add_header("#{key}: #{value}") }
      easy_setopt_httpheaders
    end
    private :set_headers

    def auto_referer=(bool)
      bool = false if bool == 0
      set_option(CURLOPT_AUTOREFERER, bool ? 1 : 0)
    end

    def verbose=(bool)
      bool = false if bool == 0
      set_option(CURLOPT_VERBOSE, bool ? 1 : 0)
      @verbose = bool
    end

    def follow_location=(bool)
      bool = false if bool == 0
      set_option(CURLOPT_FOLLOWLOCATION, bool ? 1 : 0)
      @follow_location = bool
    end 

    def max_redirects=(redirs)
      set_option(CURLOPT_MAXREDIRS, redirs)
      @max_redirects = redirs
    end

    def read_timeout_ms=(msec)
      set_option(CURLOPT_NOSIGNAL, 1)
      set_option(CURLOPT_TIMEOUT_MS, msec)
      @read_timeout_ms = msec
    end

    def connect_timeout_ms=(msec)
      set_option(CURLOPT_NOSIGNAL, 1)
      set_option(CURLOPT_CONNECTTIMEOUT_MS, msec)
      @connect_timeout_ms = msec
    end
    
    def dns_cache_timeout=(sec)
      set_option(CURLOPT_DNS_CACHE_TIMEOUT, sec)
      @dns_cache_timeout = sec
    end

    def interface=(iface)
      set_option(CURLOPT_INTERFACE, iface)
      @interface = iface
    end

    def perform
      set_headers
      easy_perform
    end

    private

    # Use Rack::Utils since its faster than CGI.
    def params_string(params_hash)
      params_hash.keys.map do |k|
        [ Rack::Utils.escape(k.to_s),
          Rack::Utils.escape(params_hash[k].to_s)
        ] * '='
      end * '&'
    end

  end
end
