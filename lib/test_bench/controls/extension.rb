module TestBench
  module Controls
    module Extension
      def self.example
        Example.build
      end

      class Example
        include TestBench::Extension

        handle Handler::Example
      end
    end
  end
end
