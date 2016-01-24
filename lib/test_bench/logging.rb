module TestBench
  module Logging
    class << self
      attr_writer :logger
      attr_writer :internal_logger

      def configure device, color_scheme: nil
        if device.tty?
          color_scheme ||= ColorScheme
        end

        logger = Logger.build device, color_scheme: color_scheme
        logger.level = 'INFO'

        self.logger = logger
      end

      def logger
        @logger ||= configure $stdout
      end

      def internal_logger
        @internal_logger ||=
          if ENV['TEST_BENCH_INTERNAL_LOGGER'] == 'on'
            ExtendedLogger::Logger.new $stdout
          else
            ::Logger.new nil
          end
      end
    end

    ColorScheme = 'DEBUG=6;?,ERROR=9;?,STEP=2;?,PASS=f;2,SKIP=3;?,FAIL=f;1,ANY=f;7'
  end

  def self.logger
    Logging.logger
  end

  def self.logger= logger
    Logging.logger = logger
  end

  def self.internal_logger
    Logging.internal_logger
  end
end
