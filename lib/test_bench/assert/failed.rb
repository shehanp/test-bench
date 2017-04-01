module TestBench
  class Assert
    class Failed < StandardError
      attr_reader :backtrace_locations

      def initialize backtrace_locations
        @backtrace_locations = backtrace_locations
      end

      def to_s
        'Assertion failed'
      end
    end
  end
end
