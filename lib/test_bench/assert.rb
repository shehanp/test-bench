module TestBench
  module Assert
    def self.call subject, message_or_mod, negate=nil, &block
      block ||= -> do subject end

      if message_or_mod.is_a? Module
        assertions = message_or_mod
      else
        message = message_or_mod
        assertions = resolve_assertions_module subject
      end

      message ||= message.to_s

      subject.extend AssertionLogger
      subject.extend assertions if assertions

      if block.arity == 0
        passed = subject.instance_exec &block
      else
        passed = subject.instance_exec subject, &block
      end

      passed = !passed if negate

      TestBench.logger.info do
        assertion_message subject, passed, message
      end

      unless passed
        stack_frame = caller_locations[1]

        line = stack_frame.lineno
        file = stack_frame.path

        TestBench.logger.error %{Assertion failure (Line: #{line}, File: #{file.inspect})}
      end

      raise Failure unless passed
    end

    def self.assertion_message subject, passed, message
      verb = if passed then verb = 'passed' else verb = 'failed' end

      if message.empty?
        "Assertion #{verb} (Target: #{subject.inspect})"
      else
        "Assertion #{verb} (Message: #{message.inspect}, Target: #{subject.inspect})"
      end
    end

    def self.resolve_assertions_module subject
      if subject.is_a? Module
        if subject.const_defined? :Assertions
          return subject.const_get :Assertions
        end
      elsif subject.class.const_defined? :Assertions
        return subject.class.const_get :Assertions
      end
    end

    def assert subject, message_or_module=nil, &block
      Assert.(subject, message_or_module, &block)
    end

    def refute subject, message_or_module=nil, &block
      Assert.(subject, message_or_module, true, &block)
    end

    def self.activate
      Object.send :include, Assert
    end

    Failure = Class.new StandardError

    module AssertionLogger
      def assertion_logger
        TestBench.logger
      end
    end
  end
end
