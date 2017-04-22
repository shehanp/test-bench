module TestBench
  module Controls
    module Output
      module Summary
        module NonPluralValues
          def self.example
            Summary.example errors: 1, files: 1, tests: 1
          end

          def self.text
            Text.example errors: 1, files: 1, tests: 1
          end
        end
      end
    end
  end
end
