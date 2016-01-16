module TestBench
  module Structure
    class LogError
      attr_reader :error
      attr_reader :message
      attr_reader :root_location

      def initialize error, message, root_location
        @error = error
        @message = message
        @root_location = root_location
      end

      def self.call error, message, root_location
        instance = new error, message, root_location
        instance.()
      end

      def call
        if error.is_a? Assert::Failure
          TestBench.logger.fail "Test #{message.inspect} failed"
        else
          lines = error.backtrace_locations

          lines = lines.take_while do |line|
            line.absolute_path != root_location.absolute_path or
              line.lineno != root_location.lineno
          end
          lines << root_location

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
