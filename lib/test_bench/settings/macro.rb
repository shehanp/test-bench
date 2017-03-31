module TestBench
  class Settings
    module Macro
      def setting attribute
        attr_accessor attribute

        settings << attribute
      end

      def settings
        @settings ||= Set.new
      end
    end
  end
end
