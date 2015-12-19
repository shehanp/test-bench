module TestBench
  Logger = ExtendedLogger.instance

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
