module TestBench
  class Run
    module Subscriber
      class Example
        include Subscriber

        def handle event
          events << event
        end

        def events
          @events ||= []
        end

        def received? event
          events.any? do |e|
            e == event
          end
        end
      end
    end
  end
end
