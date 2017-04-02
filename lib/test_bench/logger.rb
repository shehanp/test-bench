module TestBench
  module Logger
    def self.configure receiver, enabled: nil
      enabled = true if enabled.nil?

      logger = ::Logger.new device

      if enabled
        logger.level = ::Logger::DEBUG
      else
        logger.level = ::Logger::UNKNOWN
      end

      receiver.logger = logger

      logger
    end

    def self.device
      $stderr
    end
  end
end
