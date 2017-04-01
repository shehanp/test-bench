module TestBench
  module Structure
    class Example
      include Structure

      def get_subscriber
        subscriber = TestBench::Run::Subscriber::Example.new

        run = Run::Registry.get self
        run.add_subscriber subscriber

        subscriber
      end
    end
  end
end
