module TestBench
  class CheckResult < StandardError
    attr_reader :detail
    attr_reader :backtrace_locations
    attr_reader :passed

    def initialize passed, backtrace_locations, detail=nil
      @detail = detail
      @backtrace_locations = backtrace_locations
      @passed = passed
    end

    def self.build passed
      backtrace_locations = caller_locations
      instance = new passed, backtrace_locations
      instance
    end

    def backtrace
      backtrace_locations.map &:to_s
    end

    def negate
      failed = !passed
      self.class.new failed, backtrace_locations, detail
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
