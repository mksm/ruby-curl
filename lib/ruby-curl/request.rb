module Typhoeus
  class Request

    DEFAULT_OPTIONS = {
      # Debugging
      :verbose           => true,
      # Redirection
      :follow_location   => false, :max_redirects   => 0,
      # Timeouts
      :timeout           => 0,     :connect_timeout => 0,
      :dns_cache_timeout => 3600,
      # Connection
      :interface         => nil,
      # Headers
      :headers           => {},
      # Cookies
      :use_cookies       => false, :save_cookies    => false,
      # Proxy
      :proxy             => nil,
      # Callbacks
      :on_body           => nil,   :on_success      => nil,
      :on_failure        => nil,   :on_complete     => nil,
      :on_header         => nil,   :on_progress     => nil,
      :on_debug          => nil

    }

    EASY_OPTIONS = [
      :verbose,         :follow_location,   :max_redirects, :timeout,
      :connect_timeout, :dns_cache_timeout, :interface,     :headers
    ]

    EASY_CALLBACKS = [
      :on_body,   :on_success,  :on_failure, :on_complete,
      :on_header, :on_progress, :on_debug
    ]

    attr_accessor :method, :url, :params
    attr_accessor *DEFAULT_OPTIONS.keys

    def cookiejar
      @cookiejar ||= Typhoeus::CookieJar.new
    end

    def initialize(method, url, params = nil, options = {})
      @method, @params = method, params
      case @method
      when :get
        @url = @params ? "#{url}?#{params_string}" : url
        # TODO: set CURLOPT_HTTPGET flag
      when :post
        if @params
          @url = url
          @post_data = params_string
        else
          raise ArgumentError, "invalid params for POST request => '#{@params}'"
        end
      else
        raise ArgumentError, "invalid method => '#{method}'"
      end

      options = DEFAULT_OPTIONS.merge(options)
      (EASY_OPTIONS + EASY_CALLBACKS).each { |k| send("#{k}=", options.delete(k)) }

      if use_cookies and not cookiejar.empty?
        headers['Cookie'] = cookiejar.to_s
      end

      self
    end

    private

    # Use Rack::Utils since its faster than CGI.
    def params_string
      @params.keys.map do |k|
        "#{Rack::Utils.escape(k.to_s)}=#{Rack::Utils.escape(@params[k].to_s)}"
      end
    end

  end
end
