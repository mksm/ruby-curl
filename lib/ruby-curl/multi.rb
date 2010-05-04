module RubyCurl
  class Multi

    include MonitorMixin
    include Options

    def add(easy)
      synchronize { multi_add_handle(easy) }
    end

    def remove(easy)
      synchronize { multi_remove_handle(easy) }
    end

    def perform
      synchronize { multi_perform }
    end

    def cleanup
      synchronize { multi_cleanup }
    end

  end
end
