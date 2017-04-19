module TestBench
  module Structure
    module Assert
      def self.call assert_class, publisher, subject, assertions_module=nil, &action
        passed = assert_class.(subject, assertions_module, &action)

        publisher.asserted

        unless passed
          publisher.assertion_failed

          raise TestBench::Assert::Failed, "Assertion failed"
        end

        publisher.assertion_passed
      end
    end
  end
end
