module TestBench
  class Run
    include Settings::Macro
    include Observable

    setting :logger

    def log
      @log ||= Logger.configure self, enabled: logger
    end
    attr_writer :log

    def self.build settings: nil
      settings ||= Settings.build

      instance = new
      settings.set instance
      instance
    end

    def add_subscriber subscriber
      add_observer subscriber
    end

    def asserted
      event = Event::Asserted.new
      publish event
      event
    end

    def assertion_failed
      event = Event::AssertionFailed.new
      publish event
      event
    end

    def assertion_passed
      event = Event::AssertionPassed.new
      publish event
      event
    end

    def commented prose
      event = Event::Commented.new prose
      publish event
      event
    end

    def context_entered prose=nil
      event = Event::ContextEntered.new prose
      publish event
      event
    end

    def context_exited prose=nil
      event = Event::ContextExited.new prose
      publish event
      event
    end

    def error_raised error
      event = Event::ErrorRaised.new error
      publish event
      event
    end

    def finished
      event = Event::Finished.new
      publish event
      event
    end

    def test_failed error, prose=nil
      event = Event::TestFailed.new prose, error
      publish event
      event
    end

    def test_finished prose=nil
      event = Event::TestFinished.new prose
      publish event
      event
    end

    def test_passed prose=nil
      event = Event::TestPassed.new prose
      publish event
      event
    end

    def test_skipped prose=nil
      event = Event::TestSkipped.new prose
      publish event
      event
    end

    def test_started prose=nil
      event = Event::TestStarted.new prose
      publish event
      event
    end

    def started
      event = Event::Started.new
      publish event
      event
    end

    def publish event
      changed
      notify_observers event

      if event.respond_to? :digest
        digest = event.digest
      else
        digest = event.inspect
      end

      log.debug "Published event (#{digest})"
    end

    def subscribed? receiver
      observers.key? receiver
    end

    def observers
      @observer_peers
    end
  end
end
