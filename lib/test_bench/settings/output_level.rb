module TestBench
  class Settings
    module OutputLevel
      def self.verbose
        :verbose
      end

      def self.normal
        :normal
      end

      def self.silent
        :silent
      end
    end
  end
end
