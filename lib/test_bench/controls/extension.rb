module TestBench
  module Controls
    module Extension
      def self.example
        Example.build
      end

      class Example
        include TestBench::Extension

        handle Handler::Example

        def extended? run
          handlers.all? do |handler|
            run.subscribers.include? handler
          end
        end
      end
    end
  end
end
