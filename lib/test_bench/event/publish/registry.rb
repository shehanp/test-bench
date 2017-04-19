module TestBench
  module Event
    class Publish
      class Registry
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
            hash[key] = Publish.new
          end
        end
      end
    end
  end
end
