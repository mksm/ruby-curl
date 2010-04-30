module RubyCurl
  class Multi

    include Options

    def add(easy)
      raise ArgumentError, "invalid handle" if not easy.class == RubyCurl::Easy
      multi_add_handle(easy)
    end

    def remove(easy)
      raise ArgumentError, "invalid handle" if not easy.class == RubyCurl::Easy
      multi_remove_handle(easy)
    end

    def perform(e)
      multi_perform(e)
    end

    def cleanup
      multi_cleanup
    end

  end
end
