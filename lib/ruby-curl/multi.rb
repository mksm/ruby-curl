module RubyCurl
  class Multi

    attr_reader :pipelining, :max_connects

    def pipelining=(bool)
      bool = false if bool == 0
      set_option(CURLMOPT_PIPELINING, bool ? 1 : 0)
      @pipelining = bool
    end

    def max_connects=(conns)
      set_option(CURLMOPT_MAXCONNECTS, conns)
      @max_connects = conns
    end

    def add(easy)
      raise ArgumentError, "invalid handle" if not easy.class == RubyCurl::Easy
      multi_add_handle(easy)
    end

    def remove(easy)
      raise ArgumentError, "invalid handle" if not easy.class == RubyCurl::Easy
      multi_remove_handle(easy)
    end

    def perform
      multi_perform
    end

    def cleanup
      multi_cleanup
    end

  end
end
