module TestBench
  module Structure
    class Stack
      attr_reader :configuration
      attr_reader :logger

      def initialize logger, configuration
        @configuration = configuration
        @logger = logger
      end

      def self.build
        logger = TestBench.logger
        configuration = Configuration.instance

        new logger, configuration
      end

      def self.instance
        @instance ||= build
      end

      def error error
        frame = pop

        root_location = self.root_location || frame.caller_location
        LogError.(error, frame.message, root_location)

        exit 1 if configuration.fail_fast?
        exit 1 if top_level?

        errors << error
      end

      def errors
        @errors ||= []
      end

      def pop
        frame = stack.pop
        frame.popped

        if top_level?
          logger.step ''
          exit 1 if errors.any?
        end

        frame
      end

      def push message, caller_location
        frame = Frame.new message, logger, caller_location
        stack << frame
        frame.pushed
      end

      def root_location
        stack[0] && stack[0].caller_location
      end

      def stack
        @stack ||= []
      end

      def top_level?
        stack.empty?
      end

      Frame = Struct.new :message, :logger, :caller_location do
        def popped
          if message
            logger.deindent
          end

          TestBench.logger = logger
        end

        def pushed
          if message
            logger.step message
            logger.indent
          end
        end
      end
    end
  end
end
