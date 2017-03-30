module TestBench
  class Run
    include Observable

    def record activity, data
      changed
      notify_observers activity, data
    end

    alias_method :add_subscriber, :add_observer
  end
end
