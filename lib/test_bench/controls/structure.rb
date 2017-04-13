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
          run = Run.new

          subscriber = Subscriber.example
          run.add_subscriber subscriber

          instance = new subscriber
          Run::Registry::Global.put run, instance
          instance
        end

        def published? event
          subscriber.received? event
        end
      end
    end
  end
end
