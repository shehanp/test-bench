module TestBench
  module Structure
    def self.activate
      Object.send :include, self
    end

    def context message=nil, &block
      unless block
        TestBench.logger.skip message if message
        return
      end

      Stack.instance.push message

      begin
        block.() if block

      ensure
        Stack.instance.pop
      end
    end

    def test message=nil, &block
      message ||= 'Test'

      if block
        Stack.instance.push message

        begin
          block.()
          Stack.instance.pop

        rescue => error
          Stack.instance.error error
        end
      else
        context message
      end
    end
  end
end
