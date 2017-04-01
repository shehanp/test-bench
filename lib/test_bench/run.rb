module TestBench
  class Run
    include Observable

    def settings
      @settings ||= Settings.new
    end
    attr_writer :settings

    def record event
      changed
      notify_observers event
    end

    def add_subscriber subscriber
      settings.set subscriber

      add_observer subscriber
    end
  end
end
