module TestBench
  module Controls
    module Output
      module Summary
        module Failed
          def self.example
            Summary.example errors: 1
          end

          def self.text fg: nil
            Text.example errors: 1, fg: fg
          end
        end
      end
    end
  end
end
