module TestBench
  class Run
    class Registry
      module Key
        def self.call object
          if object.is_a? Binding
            receiver = object.receiver
          else
            receiver = object
          end

          receiver.hash
        end
      end
    end
  end
end
