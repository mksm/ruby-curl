module RubyCurl
  class CookieJar < Hash
    
    def initialize
      super
      @frozen = []
    end
    
    def add(*cookies)
      cookies.flatten.each do |cookie|
        k, v = cookie.split(";").first.split("=", 2)
        self[k] = v.strip unless @frozen.include? k
      end
    end
  
    alias_method :<<, :add
    
    def preserve_cookies
      @frozen = keys
    end
    
    def merge!(h2)
      other_hash = h2.dup
      other_hash.delete_if { |k,v| @frozen.include? k }
      super(other_hash)
    end
    
    def to_s
      map { |ary| ary * "=" } * "; "
    end
    
  end
end
