module TestBench
  module Structure
    extend Logging

    def self.activate
      Object.send :include, self
    end

    def context message=nil, &block
      if message
        logger.heading message
        logger.indent
      end

      old_logger = logger

      begin
        block.() if block

      ensure
        if message
          logger.indentation = old_logger.indentation
          logger.deindent

          if logger.indentation.zero?
            logger.heading "\n"
          end
        end
      end
    end

    def test message, &block
      logger.heading message
      logger.indent

      old_logger = logger

      begin
        block.() if block

      ensure
        if message
          logger.indentation = old_logger.indentation
          logger.deindent
        end
      end
    end
  end
end
