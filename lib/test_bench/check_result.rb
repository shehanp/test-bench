module TestBench
  class CheckResult < StandardError
    attr_reader :detail
    attr_reader :backtrace
    attr_reader :passed

    def initialize passed, backtrace, detail=nil
      @detail = detail
      @backtrace = backtrace
      @passed = passed
    end

    def self.build passed
      backtrace = caller_locations
      instance = new passed, backtrace
      instance
    end

    def negate
      failed = !passed
      self.class.new failed, backtrace, detail
    end

    def passed?
      passed
    end
  end

  def self.CheckResult object
    if object.is_a? CheckResult
      object
    else
      passed = if object then true else false end
      CheckResult.build passed
    end
  end
end
