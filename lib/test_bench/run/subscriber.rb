module TestBench
  class Run
    class Subscriber
      def recorded _, _
      end

      def update activity, data
        recorded activity, data
      end
    end
  end
end
