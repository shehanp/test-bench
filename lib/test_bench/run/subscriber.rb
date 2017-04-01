module TestBench
  class Run
    module Subscriber
      def self.included cls
        cls.class_exec do
          extend Settings::Macro
        end
      end

      def handle event
      end

      def settings
        self.class.settings
      end

      def update event
        handle event
      end
    end
  end
end
