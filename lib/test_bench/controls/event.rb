module TestBench
  module Controls
    module Event
      def self.example
        asserted
      end

      def self.asserted
        TestBench::Event::Asserted.new
      end

      def self.assertion_passed
        TestBench::Event::AssertionPassed.new
      end

      def self.assertion_failed
        TestBench::Event::AssertionFailed.new
      end

      def self.commented prose: nil
        prose = Prose.example prose, default: 'Some comment'

        TestBench::Event::Commented.new prose
      end

      def self.context_entered prose: nil
        prose = Prose.example prose, default: 'Some Context'

        TestBench::Event::ContextEntered.new prose
      end

      def self.context_exited prose: nil
        prose = Prose.example prose, default: 'Some Context'

        TestBench::Event::ContextExited.new prose
      end

      def self.error_raised error: nil
        error ||= Error.example

        TestBench::Event::ErrorRaised.new error
      end

      def self.file_entered path: nil
        path ||= Path.example

        TestBench::Event::FileEntered.new path
      end

      def self.file_exited path: nil
        path ||= Path.example

        TestBench::Event::FileExited.new path
      end

      def self.finished
        TestBench::Event::Finished.new
      end

      def self.started
        TestBench::Event::Started.new
      end

      def self.test_failed prose: nil, error: nil
        error ||= Error.example
        prose = Prose.example prose, default: 'Some test'

        TestBench::Event::TestFailed.new prose, error
      end

      def self.test_finished prose: nil
        prose = Prose.example prose, default: 'Some test'

        TestBench::Event::TestFinished.new prose
      end

      def self.test_passed prose: nil
        prose = Prose.example prose, default: 'Some test'

        TestBench::Event::TestPassed.new prose
      end

      def self.test_skipped prose: nil
        prose = Prose.example prose, default: 'Some test'

        TestBench::Event::TestSkipped.new prose
      end

      def self.test_started prose: nil
        prose = Prose.example prose, default: 'Some test'

        TestBench::Event::TestStarted.new prose
      end
    end
  end
end
