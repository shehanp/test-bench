module TestBench
  module Controls
    module Structure
      def self.example
        Example.build
      end

      class Example
        include TestBench::Structure

        attr_reader :subscriber

        def initialize subscriber
          @subscriber = subscriber
        end

        def self.build
          publish = TestBench::Event::Publish.new

          subscriber = Subscriber.example
          publish.add_subscriber subscriber

          instance = new subscriber
          TestBench::Event::Publish::Registry::Global.put publish, instance
          instance
        end

        def published? event
          subscriber.received? event
        end
      end
    end
  end
end
