module TestBench
  class Output
    module Clock
      def self.configure receiver
        clock = Time

        receiver.public_send :clock=, clock

        clock
      end
    end
  end
end
