module TestBench
  class Assert
    attr_reader :block
    attr_reader :message
    attr_reader :subject

    def initialize subject, assertions_module, message, block
      @assertions_module = assertions_module
      @block = block
      @message = message
      @subject = subject
    end

    def self.build subject, message_or_mod, &block
      block ||= -> do subject end

      if message_or_mod.is_a? Module
        assertions_module = message_or_mod
      else
        message = message_or_mod
        assertions_module = nil
      end

      new subject, assertions_module, message, block
    end

    def self.call *arguments, &block
      instance = build *arguments, &block
      instance.()
    end

    def assertions_module
      @assertions_module ||= resolve_assertions_module
    end

    def call
      message ||= message.to_s

      subject.extend assertions_module if assertions_module

      if block.arity == 0
        return_value = subject.instance_exec &block
      else
        return_value = subject.instance_exec subject, &block
      end

      passed = passed? return_value

      log_assertion_message passed

      unless passed
        stack_frame = caller_locations[1]

        line = stack_frame.lineno
        file = stack_frame.path

        TestBench.logger.error %{Assertion failure (Line: #{line}, File: #{file.inspect})}
      end

      raise Failure unless passed
    end

    def log_assertion_message passed
      TestBench.logger.info do
        verb = if passed then verb = 'passed' else verb = 'failed' end

        if message.nil? or message.empty?
          "Assertion #{verb} (Target: #{subject.inspect})"
        else
          "Assertion #{verb} (Message: #{message.inspect}, Target: #{subject.inspect})"
        end
      end
    end

    def passed? return_value
      if return_value
        true
      else
        false
      end
    end

    def resolve_assertions_module
      if subject.is_a? Module
        if subject.const_defined? :Assertions
          return subject.const_get :Assertions
        end
      elsif subject.class.const_defined? :Assertions
        return subject.class.const_get :Assertions
      end
    end

    def self.activate
      Object.send :include, Methods
    end

    class Refute < Assert
      def passed? return_value
        not return_value
      end
    end

    module Methods
      def assert subject, message_or_module=nil, &block
        Assert.(subject, message_or_module, &block)
      end

      def refute subject, message_or_module=nil, &block
        Refute.(subject, message_or_module, &block)
      end
    end

    Failure = Class.new StandardError
  end
end
