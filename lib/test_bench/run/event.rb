module TestBench
  class Run
    module Event
      module File
        Entered = Struct.new :path do
          def digest
            "Type: File::Entered, Path: #{path}"
          end
        end

        Exited = Struct.new :path do
          def digest
            "Type: File::Exited, Path: #{path}"
          end
        end
      end

      module Context
        Entered = Struct.new :prose do
          def digest
            "Type: Context::Entered, Prose: #{prose || '(none)'}"
          end
        end

        Exited = Struct.new :prose do
          def digest
            "Type: Context::Exited, Prose: #{prose || '(none)'}"
          end
        end
      end

      module Test
        Started = Struct.new :prose do
          def digest
            "Type: Test::Started, Prose: #{prose || '(none)'}"
          end
        end

        Finished = Struct.new :prose do
          def digest
            "Type: Test::Finished, Prose: #{prose || '(none)'}"
          end
        end

        Passed = Struct.new :prose do
          def digest
            "Type: Test::Passed, Prose: #{prose || '(none)'}"
          end
        end

        Failed = Struct.new :prose, :error do
          def digest
            "Type: Test::Failed, Prose: #{prose || '(none)'}, Error: #{error.class}, Message: #{error.message.inspect}"
          end
        end

        Skipped = Struct.new :prose do
          def digest
            "Type: Test::Skipped, Prose: #{prose || '(none)'}"
          end
        end
      end

      module Assertion
        Asserted = Class.new do
          def digest
            "Type: Assertion::Asserted"
          end
        end

        Passed = Class.new do
          def digest
            "Type: Assertion::Passed"
          end
        end

        Failed = Class.new do
          def digest
            "Type: Assertion::Failed"
          end
        end
      end

      Started = Class.new do
        def digest
          "Type: Started"
        end
      end

      Finished = Class.new do
        def digest
          "Type: Finished"
        end
      end

      Commented = Struct.new :prose do
        def digest
          "Type: Commented, Prose: #{prose || '(none)'}"
        end
      end

      ErrorRaised = Struct.new :error do
        def digest
          "Type: Error::Raised, Error: #{error.class}, Message: #{error.message.inspect}"
        end
      end
    end
  end
end
