module RubyCurl
  class Easy

    include Options
    include Info

    attr_reader   :method, :headers
    attr_accessor :use_cookies, :save_cookies

    def initialize
      @headers = {}
    end

    def method_missing(method, *args)
      if Options::METHOD_MAP[method]
        instance_variable_get("@#{method}")
      elsif method.to_s =~ /(\w+)=$/
        set_option(Options::METHOD_MAP[$1.to_sym], *args)
        instance_variable_set("@#{$1}", *args)
      else
        super
      end
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
      case meth
      when :get
        set_option(CURLOPT_HTTPGET, 1)
      when :post
        set_option(CURLOPT_POST, 1)
      end
      @method = m
    end

    def perform
      #if @use_cookies and not @jar.empty?
      #  @headers['Cookie'] = @jar.to_s
      #end

      @headers.each { |k, v| easy_add_header("#{key}: #{value}") }
      easy_setopt_httpheaders

      easy_perform

      #if @save_cookies and headers_hash['Set-Cookie']
      #  @jar << headers_hash['Set-Cookie']
      #end
    end

  end
end
