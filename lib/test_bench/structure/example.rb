module TestBench
  module Structure
    class Example
      include Structure

      attr_reader :subscriber

      def initialize subscriber
        @subscriber = subscriber
      end

      def self.build
        run = Run.new

        subscriber = Run::Subscriber::Example.new
        run.add_subscriber subscriber

        instance = new subscriber
        Run::Registry.put run, instance
        instance
      end

      def published? event
        subscriber.received? event
      end
    end
  end
end
