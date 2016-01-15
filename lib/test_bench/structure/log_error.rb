module TestBench
  module Structure
    class LogError
      attr_reader :error
      attr_reader :message

      def initialize error, message
        @error = error
        @message = message
      end

      def self.call error, message
        instance = new error, message
        instance.()
      end

      def call
        if error.is_a? Assert::Failure
          TestBench.logger.fail "Test #{message.inspect} failed"
        else
          lines = error.backtrace_locations
          lines.map! do |line|
            "    from #{line}"
          end
          lines.unshift "#{error.class}: #{error.message}"

          lines.each do |line|
            TestBench.logger.error line
          end

          TestBench.logger.fail "Test #{message.inspect} errored"
        end
      end
    end
  end
end
