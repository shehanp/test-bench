module TestBench
  module Logging
    class << self
      attr_writer :logger
      attr_writer :internal_logger

      def configure *arguments
        logger = Logger.build *arguments

        self.logger = logger
      end

      def logger
        @logger ||= configure nil
      end

      def internal_logger
        @internal_logger ||= ::Logger.new nil
      end
    end

    def logger
      Logging.logger
    end

    def internal_logger
      Logging.internal_logger
    end
  end

  extend Logging
end
