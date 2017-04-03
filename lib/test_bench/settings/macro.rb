module TestBench
  class Settings
    module Macro
      def self.extended receiver
        receiver.extend Setting
        receiver.extend Settings
      end

      def self.included cls
        cls.class_exec do
          extend Setting
          extend Settings
        end
      end

      def settings
        self.class.settings
      end

      module Setting
        def setting attribute
          attr_accessor attribute

          settings << attribute
        end
      end

      module Settings
        def settings
          @settings ||= Set.new
        end
      end
    end
  end
end
