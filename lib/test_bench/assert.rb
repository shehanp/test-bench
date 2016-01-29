module TestBench
  class Assert
    attr_reader :block
    attr_reader :frame
    attr_reader :message
    attr_reader :subject

    def initialize subject, assertions_module, message, frame, block
      @assertions_module = assertions_module
      @block = block
      @frame = frame
      @message = message
      @subject = subject
    end

    def self.build subject, message_or_mod, frame, &block
      block ||= -> do subject end

      if message_or_mod.is_a? Module
        assertions_module = message_or_mod
      else
        message = message_or_mod
        assertions_module = nil
      end

      new subject, assertions_module, message, frame, block
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

      output = run_block
      passed = if output then true else false end

      log_assertion_message passed

      unless passed
        line = frame.lineno
        file = frame.path

        TestBench.logger.error %{Assertion failure (Line: #{line}, File: #{file.inspect})}
      end

      raise Failure unless passed
    end

    def log_assertion_message passed
      TestBench.logger.debug do
        verb = if passed then verb = 'passed' else verb = 'failed' end

        if message.nil? or message.empty?
          "Assertion #{verb} (Subject: #{subject.inspect})"
        else
          "Assertion #{verb} (Message: #{message.inspect}, Subject: #{subject.inspect})"
        end
      end
    end

    def resolve_assertions_module
      if subject.is_a? Class
        if subject.singleton_class.const_defined? :Assertions
          return subject.singleton_class.const_get :Assertions
        end
      elsif subject.is_a? Module
        if subject.const_defined? :Assertions
          return subject.const_get :Assertions
        end
      elsif subject.class.const_defined? :Assertions
        return subject.class.const_get :Assertions
      end
    end

    def run_block
      if block.arity == 0
        return_value = subject.instance_exec &block
      else
        return_value = subject.instance_exec subject, &block
      end

      if return_value then true else false end
    end

    def self.activate
      Object.send :include, Methods
    end

    module Methods
      def assert subject, message_or_module=nil, &block
        frame = caller_locations[0]
        Assert.(subject, message_or_module, frame, &block)
      end
    end

    Failure = Class.new StandardError
  end
end
