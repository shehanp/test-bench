module TestBench
  class Assert
    attr_reader :subject

    def action
      @action ||= proc { self }
    end
    attr_writer :action

    def initialize subject
      @subject = subject
    end

    def self.build subject, assertions_module=nil, &action
      AssertionsModule.(subject, assertions_module)

      instance = new subject
      instance.action = action unless action.nil?
      instance
    end

    def self.call *arguments, &action
      instance = build *arguments, &action
      instance.()
    end

    def call
      result = subject.instance_exec subject, &action

      passed? result
    end

    def passed? result
      if result then true else false end
    end
  end
end
