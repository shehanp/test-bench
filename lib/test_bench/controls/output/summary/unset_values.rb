module TestBench
  module Controls
    module Output
      module Summary
        module UnsetValues
          def self.example
            TestBench::Output::Summary.new
          end

          def self.text
            <<~TEXT
            Finished running 0 files
            Ran 0 tests in ???s (??? tests/second)
            0 passed, 0 failed, 0 skipped, 0 total errors
            TEXT
          end
        end
      end
    end
  end
end
