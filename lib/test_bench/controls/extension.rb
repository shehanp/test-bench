module TestBench
  module Controls
    module Extension
      def self.example
        Example.build
      end

      class Example
        include TestBench::Extension

        handle Handler::Example

        def subscribed? publisher
          handlers.all? do |handler|
            publisher.subscribers.include? handler
          end
        end
      end
    end
  end
end
