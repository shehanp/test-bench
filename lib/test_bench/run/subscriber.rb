module TestBench
  class Run
    module Subscriber
      def self.included cls
        cls.class_exec do
          include Settings::Macro
        end
      end

      # FIXME - this is our plugin system, so each subscriber needs Settings!
      def recorded _, _
      end

      def settings
        self.class.settings
      end

      def update activity, data
        recorded activity, data
      end
    end
  end
end
