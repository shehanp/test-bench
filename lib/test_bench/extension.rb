module TestBench
  module Extension
    def self.included cls
      cls.class_exec do
        extend Build
        extend Call
        extend HandleMacro
      end
    end

    attr_reader :handlers

    def initialize *handlers
      @handlers = handlers
    end

    def configure
    end

    def call run
      handlers.each do |handler|
        run.add_subscriber handler
      end
    end

    module HandleMacro
      def handle handler_class
        self.handlers << handler_class
      end

      def handlers
        @handlers ||= Set.new
      end
    end

    module Build
      def build
        handlers = self.handlers.map do |handler_class|
          handler_class.build
        end

        instance = new *handlers
        instance.configure
        instance
      end
    end

    module Call
      def call run
        instance = build
        instance.(run)
      end
    end
  end
end
