module TestBench
  module Structure
    module Assert
      def self.call assert_class, binding, subject, assertions_module=nil, &action
        passed = assert_class.(subject, assertions_module, &action)

        run = Run::Registry.get binding
        run.record Run::Event::Assertion::Asserted.new

        unless passed
          run.record Run::Event::Assertion::Failed.new

          backtrace_locations = caller_locations
          backtrace_locations.shift

          raise TestBench::Assert::Failed.new(backtrace_locations)
        end

        run.record Run::Event::Assertion::Passed.new
      end
    end
  end
end
