module RubyCurl
  class Easy

    include Options
    include Info

    attr_reader   :method, :headers, :header_str, :body_str
    attr_accessor :use_cookies, :save_cookies

    def initialize
      @headers = {}
      @jar = CookieJar.new
    end

    def get(url, params = nil, options = {})
      options[:method] = :get
      options[:url]    = params ? "#{url}?#{params_string(params)}" : url
      options.each { |o,v| send("#{o}=", v) }
      perform
    end

    def post(url, params, options = {})
      options[:method]      = :post
      options[:url]         = url
      options[:post_fields] = params_string(params)
      options.each { |o,v| send("#{o}=", v) }
      perform
    end

    def method=(m)
      case m
      when :get
        set_option(CURLOPT_HTTPGET, 1)
      when :post
        set_option(CURLOPT_POST, 1)
      end
      @method = m
    end

    def perform
      if @use_cookies and not @jar.empty?
        easy_append_header("%s: %s" % ['Cookie', @jar])
      end

      @headers.each { |k, v| easy_append_header("%s: %s" % [k,v]) }
      easy_setopt_httpheader
      easy_perform

      if @save_cookies and headers_hash['Set-Cookie']
        @jar << headers_hash['Set-Cookie']
      end

      true
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

    def headers_hash
      header_str.split("\n").map {|o| o.strip}.inject({}) do |hash, o|
        if o.empty?
          hash
        else
          i = o.index(":") || o.size
          key = o.slice(0, i)
          value = o.slice(i + 1, o.size)
          value = value.strip unless value.nil?
          if hash.has_key? key
            hash[key] = [hash[key], value].flatten
          else
            hash[key] = value
          end

          hash
        end
      end
    end

  end
end
