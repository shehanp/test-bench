module TestBench
  class Assert
    class Refute < Assert
      def passed? result
        not super
      end
    end
  end
end
