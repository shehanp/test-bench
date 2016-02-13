module TestBench
  module Logging
    def self.configure device
      logger = Logger.build device
      TestBench.logger = logger
    end

    def self.get receiver
      registry.get receiver
    end

    def self.registry
      @registry ||= ExtendedLogger::Registry.build Logger, :device => $stdout
    end
  end

  def self.logger
    @logger ||= Logging.get self
  end

  def self.logger= logger
    @logger = logger
  end
end
