module TestBench
  module Controls
    module Event
      def self.asserted
        Asserted.new
      end

      def self.assertion_passed
        AssertionPassed.new
      end

      def self.assertion_failed
        AssertionFailed.new
      end

      def self.commented prose=nil
        prose = Prose.example prose, default: 'Some comment'

        Run::Event::Commented.new prose
      end

      def self.context_entered prose=nil
        prose = Prose.example prose, default: 'Some Context'

        ContextEntered.new prose
      end

      def self.context_exited prose=nil
        prose = Prose.example prose, default: 'Some Context'

        ContextExited.new prose
      end

      def self.error_raised error=nil
        error ||= Error.build

        ErrorRaised.new error
      end

      def self.file_entered path=nil
        path ||= Path.example

        FileEntered.new path
      end

      def self.file_exited path=nil
        path ||= Path.example

        FileExited.new path
      end

      def self.finished
        Finished.new
      end

      def self.started
        Started.new
      end

      def self.test_failed prose, error: nil
        error ||= Error.build
        prose = Prose.example prose, default: 'Some test'

        TestFailed.new prose, error
      end

      def self.test_finished prose=nil
        prose = Prose.example prose, default: 'Some test'

        TestFinished.new prose
      end

      def self.test_passed prose=nil
        prose = Prose.example prose, default: 'Some test'

        TestPassed.new prose
      end

      def self.test_skipped
        prose = Prose.example prose, default: 'Some test'

        TestSkipped.new prose
      end

      def self.test_started prose=nil
        prose = Prose.example prose, default: 'Some test'

        TestStarted.new prose
      end
    end
  end
end
