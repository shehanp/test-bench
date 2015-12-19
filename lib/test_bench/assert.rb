module TestBench
  module Assert
    def self.activate
      Object.send :include, Assert
    end

    def assert check_result, detail=nil
      check_result = TestBench::CheckResult(check_result)
      detail ||= check_result.detail

      Logger.debug do
        if detail
          "Asserted (Detail: #{detail}, Passed: #{check_result.passed?})"
        else
          "Asserted (Passed: #{check_result.passed?})"
        end
      end

      unless check_result.passed?
        Logger.fatal detail if detail
        raise Failed.new check_result
      end
    end

    def refute check_result, detail=nil
      check_result = TestBench::CheckResult(check_result)

      assert check_result.negate, detail
    end

    class Failed < StandardError
      attr_reader :check_result

      def initialize check_result
        @check_result = check_result
      end

      def backtrace
        check_result.backtrace.map &:to_s
      end

      def to_s
        'Assertion failed'.freeze
      end
    end
  end
end
