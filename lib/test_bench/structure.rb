module TestBench
  module Structure
    def assert subject, assertions_module=nil, &action
      publisher = Event::Publish::Registry::Global.get binding

      Assert.(TestBench::Assert, publisher, subject, assertions_module, &action)
    end

    def comment prose
      publisher = Event::Publish::Registry::Global.get binding

      publisher.commented prose
    end

    def context prose=nil, &block
      unless prose.nil? || String === prose
        raise TypeError, "Prose must be a string"
      end

      publisher = Event::Publish::Registry::Global.get binding

      publisher.context_entered prose

      begin
        block.() unless block.nil?
      rescue => error
        publisher.error_raised error
      ensure
        publisher.context_exited prose
      end
    end

    def refute subject, assertions_module=nil, &action
      publisher = Event::Publish::Registry::Global.get binding

      Assert.(TestBench::Assert::Refute, publisher, subject, assertions_module, &action)
    end

    def test prose=nil, &block
      unless prose.nil? || String === prose
        raise TypeError, "Prose must be a string"
      end

      publisher = Event::Publish::Registry::Global.get binding

      publisher.test_started prose

      if block.nil?
        publisher.test_skipped prose
        return
      end

      begin
        block.()
        publisher.test_passed prose

      rescue => error
        publisher.error_raised error
        publisher.test_failed error, prose

      ensure
        publisher.test_finished prose
      end
    end
  end
end
