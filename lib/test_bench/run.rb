module TestBench
  class Run
    include Observable

    def settings
      @settings ||= Settings.new
    end
    attr_writer :settings

    def add_subscriber subscriber
      settings.set subscriber

      add_observer subscriber
    end

    def asserted
      event = Event::Assertion::Asserted.new
      record event
      event
    end

    def assertion_failed
      event = Event::Assertion::Failed.new
      record event
      event
    end

    def assertion_passed
      event = Event::Assertion::Passed.new
      record event
      event
    end

    def commented prose
      event = Event::Commented.new prose
      record event
      event
    end

    def context_entered prose=nil
      event = Event::Context::Entered.new prose
      record event
      event
    end

    def context_exited prose=nil
      event = Event::Context::Exited.new prose
      record event
      event
    end

    def error_raised error
      event = Event::ErrorRaised.new error
      record event
      event
    end

    def test_failed error, prose=nil
      event = Event::Test::Failed.new prose, error
      record event
      event
    end

    def test_finished prose=nil
      event = Event::Test::Finished.new prose
      record event
      event
    end

    def test_passed prose=nil
      event = Event::Test::Passed.new prose
      record event
      event
    end

    def test_skipped prose=nil
      event = Event::Test::Skipped.new prose
      record event
      event
    end

    def test_started prose=nil
      event = Event::Test::Started.new prose
      record event
      event
    end

    def record event
      changed
      notify_observers event
    end
  end
end
