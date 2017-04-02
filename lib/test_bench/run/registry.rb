module TestBench
  class Run
    class Registry
      def self.instance
        @instance ||= new
      end

      def self.get receiver
        instance.get receiver
      end

      def self.put run, receiver
        instance.put run, receiver
      end

      def get receiver
        key = Key.(receiver)

        table[key]
      end

      def put run, receiver
        key = Key.(receiver)

        table[key] = run
      end

      def table
        @table ||= Hash.new do |hash, key|
          hash[key] = Run.new
        end
      end
    end
  end
end
