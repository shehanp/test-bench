module TestBench
  module Controls
    module Output
      module Summary
        def self.example errors: nil, files: nil, tests: nil, tests_passed: nil, tests_failed: nil, tests_skipped: nil
          errors ||= self.errors
          files ||= self.files
          tests ||= self.tests
          tests_skipped ||= self.tests_skipped
          tests_failed ||= self.tests_failed
          tests_passed ||= self.tests_passed
          start_time ||= self.start_time
          finish_time ||= self.finish_time

          summary = TestBench::Output::Summary.new

          summary.errors = errors

          summary.files = files

          summary.tests = tests
          summary.tests_passed = tests_passed
          summary.tests_failed = tests_failed
          summary.tests_skipped = tests_skipped

          summary.start_time = start_time
          summary.clock.now = finish_time

          summary
        end

        def self.errors
          0
        end

        def self.files
          2
        end

        def self.tests
          3
        end

        def self.tests_passed
          4
        end

        def self.tests_failed
          5
        end

        def self.tests_skipped
          6
        end

        def self.start_time
          Time.example
        end

        def self.finish_time
          Controls::Time.example offset_milliseconds: 1
        end

        def self.elapsed_time
          finish_time - start_time
        end
      end
    end
  end
end
