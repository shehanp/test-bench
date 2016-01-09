module TestBench
  class CLI
    class Options
      attr_reader :child_count
      attr_reader :exclude_pattern
      attr_reader :fail_fast
      attr_writer :log_level
      attr_reader :reverse_backtraces

      def self.build
        instance = new
        instance.child_count = ENV.fetch 'TEST_BENCH_CHILD_COUNT', 1
        instance.exclude_pattern = ENV.fetch 'TEST_BENCH_EXCLUDE_PATTERN', '^$'
        instance.fail_fast = ENV.fetch 'TEST_BENCH_FAIL_FAST', false
        instance.reverse_backtraces = ENV.fetch 'TEST_BENCH_REVERSE_BACKTRACES', true
        instance
      end

      def child_count= value
        @child_count = Integer(value)
      end

      def decrease_verbosity
        self.log_level += 1
      end

      def exclude_pattern= pattern
        @exclude_pattern = Regexp.new pattern
      end

      def fail_fast= value
        @fail_fast = truthy? value
      end

      def increase_verbosity
        self.log_level -= 1
      end

      def log_level
        @log_level ||= 0
      end

      def reverse_backtraces= value
        @reverse_backtraces = truthy? value
      end

      def to_h
        instance_variables.each_with_object Hash.new do |ivar, hash|
          key = ivar.to_s
          key.slice! 0, 1

          value = instance_variable_get ivar

          hash[key] = value
        end
      end

      def truthy? value
        case value
        when String then value.downcase == 'on'
        else !!value
        end
      end
    end
  end
end
