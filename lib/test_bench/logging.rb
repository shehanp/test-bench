module TestBench
  Logger = ExtendedLogger.get self, level: 'INFO', device: $stdout

  Logger.formatter = -> severity, datetime, progname, message do
    timestamp = datetime.strftime '%H:%M:%S.%L'
    "[#{timestamp}] #{severity} #{progname}: #{message}\n"
  end

  if ENV['TEST_BENCH_INTERNAL_LOGGING'] == 'on'
    InternalLogger = Logger
  else
    InternalLogger = ExtendedLogger.new '/dev/null'
  end

  module Logging
    def self.activate
      Object.send :include, Logging
    end

    def logger
      TestBench::Logger
    end
  end
end
