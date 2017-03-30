module TestBench
  class Run
    class Registry
      def self.instance
        @instance ||= new
      end

      def get receiver
        key = Key.(receiver)

        table[key]
      end

      def put settings, receiver
        key = Key.(receiver)

        table[key] = settings
      end

      def table
        @table ||= Hash.new do |hash, key|
          hash[key] = Run.new
        end
      end
    end
  end
end
