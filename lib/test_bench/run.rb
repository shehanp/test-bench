module TestBench
  class Run
    include Observable

    def settings
      @settings ||= Settings.new
    end
    attr_writer :settings

    def logger
      @logger ||= Logger.configure self, enabled: settings.logger
    end
    attr_writer :logger

    def self.build
      instance = new
      instance.settings = Settings.build
      instance
    end

    def add_subscriber subscriber
      add_observer subscriber
    end

    def asserted
      event = Event::Assertion::Asserted.new
      publish event
      event
    end

    def assertion_failed
      event = Event::Assertion::Failed.new
      publish event
      event
    end

    def assertion_passed
      event = Event::Assertion::Passed.new
      publish event
      event
    end

    def commented prose
      event = Event::Commented.new prose
      publish event
      event
    end

    def context_entered prose=nil
      event = Event::Context::Entered.new prose
      publish event
      event
    end

    def context_exited prose=nil
      event = Event::Context::Exited.new prose
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
      event = Event::Test::Failed.new prose, error
      publish event
      event
    end

    def test_finished prose=nil
      event = Event::Test::Finished.new prose
      publish event
      event
    end

    def test_passed prose=nil
      event = Event::Test::Passed.new prose
      publish event
      event
    end

    def test_skipped prose=nil
      event = Event::Test::Skipped.new prose
      publish event
      event
    end

    def test_started prose=nil
      event = Event::Test::Started.new prose
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

      logger.debug "Published event (#{digest})"
    end
  end
end
