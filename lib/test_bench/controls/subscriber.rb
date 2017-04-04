module TestBench
  module Controls
    module Subscriber
      def self.example
        Example.new
      end

      class Example
        include TestBench::Run::Subscriber

        def handle event
          events << event
        end

        def events
          @events ||= []
        end

        def received? event
          events.any? do |e|
            e == event || event === e
          end
        end
      end
    end
  end
end
