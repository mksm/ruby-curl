module RubyCurl
  class Easy

    attr_reader :url,               :method,          :params,        
                :auto_referer,      :verbose,         :follow_location,
                :max_redirects,     :read_timeout_ms, :connect_timeout_ms,
                :dns_cache_timeout, :interface

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
