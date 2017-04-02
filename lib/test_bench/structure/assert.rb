module TestBench
  module Structure
    module Assert
      def self.call assert_class, run, subject, assertions_module=nil, &action
        passed = assert_class.(subject, assertions_module, &action)

        run.asserted

        unless passed
          run.assertion_failed

          raise TestBench::Assert::Failed, "Assertion failed"
        end

        run.assertion_passed
      end
    end
  end
end
