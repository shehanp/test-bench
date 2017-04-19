module TestBench
  class Output
    class ExitStatus
      include Extension::Handle
      include Event

      attr_accessor :error

      def nesting
        @nesting ||= 0
      end
      attr_writer :nesting

      setting :abort_on_error

      handle ContextEntered do
        self.nesting += 1
      end

      handle ContextExited do
        self.nesting -= 1

        if nesting.zero? || abort_on_error
          exit 1 unless error.nil?
        end
      end

      handle TestFinished do
        if abort_on_error
          exit 1 unless error.nil?
        end
      end

      handle ErrorRaised do |event|
        self.error = event.error
      end
    end
  end
end
