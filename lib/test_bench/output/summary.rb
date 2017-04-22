module TestBench
  class Output
    class Summary
      include Extension::Handle

      include Clock::Dependency
      include Write::Dependency

      include Event

      setting :output_level
      def output_level
        @output_level ||= Settings::OutputLevel.normal
      end

      attr_accessor :errors
      attr_accessor :files
      attr_accessor :finish_time
      attr_accessor :start_time
      attr_accessor :tests
      attr_accessor :tests_failed
      attr_accessor :tests_passed
      attr_accessor :tests_skipped

      def initialize
        @errors = 0
        @files = 0
        @tests = 0
        @tests_failed = 0
        @tests_passed = 0
        @tests_skipped = 0
      end

      def configure
        Write.configure self
      end

      handle ErrorRaised do
        self.errors += 1
      end

      handle FileExited do
        self.files += 1
      end

      handle Finished do
        return if output_level == Settings::OutputLevel.silent

        self.finish_time = clock.now

        write.("Finished running #{files.inspect} file#{'s' unless files == 1}")

        if elapsed_time = self.elapsed_time
          elapsed = '%0.3f' % elapsed_time

          tests_per_second = '%0.2f' % Rational(tests, elapsed)
        end

        fg = errors == 0 ? :cyan : :red

        write.(<<~TEXT.chomp, fg: fg)
        Ran #{tests} test#{'s' unless tests == 1} in #{elapsed || '???'}s (#{tests_per_second || '???'} tests/second)
        #{tests_passed} passed, #{tests_failed} failed, #{tests_skipped} skipped, #{errors} total error#{'s' unless errors == 1}
        TEXT
      end

      handle Started do
        self.start_time = clock.now
      end

      handle TestFailed do
        self.tests_failed += 1
      end

      handle TestFinished do
        self.tests += 1
      end

      handle TestPassed do
        self.tests_passed += 1
      end

      handle TestSkipped do
        self.tests_skipped += 1
      end

      def elapsed_time
        if start_time.nil? || finish_time.nil?
          return nil
        end

        finish_time - start_time
      end
    end
  end
end
