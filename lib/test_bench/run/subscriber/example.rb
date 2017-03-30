module TestBench
  class Run
    class Subscriber
      class Example < Subscriber
        def recorded activity, data
          entries << [activity, data]
        end

        def entries
          @entries ||= []
        end

        def received? activity, data=nil
          entries.any? do |a, d|
            if a != activity
              false
            elsif data.nil?
              true
            else
              d == data
            end
          end
        end
      end
    end
  end
end
