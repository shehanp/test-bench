module TestBench
  module Controls
    module Event
      def self.example
        asserted
      end

      def self.asserted
        Run::Event::Asserted.new
      end

      def self.assertion_passed
        Run::Event::AssertionPassed.new
      end

      def self.assertion_failed
        Run::Event::AssertionFailed.new
      end

      def self.commented prose: nil
        prose = Prose.example prose, default: 'Some comment'

        Run::Event::Commented.new prose
      end

      def self.context_entered prose: nil
        prose = Prose.example prose, default: 'Some Context'

        Run::Event::ContextEntered.new prose
      end

      def self.context_exited prose: nil
        prose = Prose.example prose, default: 'Some Context'

        Run::Event::ContextExited.new prose
      end

      def self.error_raised error: nil
        error ||= Error.example

        Run::Event::ErrorRaised.new error
      end

      def self.file_entered path: nil
        path ||= Path.example

        Run::Event::FileEntered.new path
      end

      def self.file_exited path: nil
        path ||= Path.example

        Run::Event::FileExited.new path
      end

      def self.finished
        Run::Event::Finished.new
      end

      def self.started
        Run::Event::Started.new
      end

      def self.test_failed prose: nil, error: nil
        error ||= Error.example
        prose = Prose.example prose, default: 'Some test'

        Run::Event::TestFailed.new prose, error
      end

      def self.test_finished prose: nil
        prose = Prose.example prose, default: 'Some test'

        Run::Event::TestFinished.new prose
      end

      def self.test_passed prose: nil
        prose = Prose.example prose, default: 'Some test'

        Run::Event::TestPassed.new prose
      end

      def self.test_skipped prose: nil
        prose = Prose.example prose, default: 'Some test'

        Run::Event::TestSkipped.new prose
      end

      def self.test_started prose: nil
        prose = Prose.example prose, default: 'Some test'

        Run::Event::TestStarted.new prose
      end
    end
  end
end
