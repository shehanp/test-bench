module TestBench
  class Run
    module Event
      Asserted = Class.new do
        def digest
          "Type: AssertionAsserted"
        end
      end

      AssertionPassed = Class.new do
        def digest
          "Type: AssertionPassed"
        end
      end

      AssertionFailed = Class.new do
        def digest
          "Type: AssertionFailed"
        end
      end

      Commented = Struct.new :prose do
        def digest
          "Type: Commented, Prose: #{prose || '(none)'}"
        end
      end

      ContextEntered = Struct.new :prose do
        def digest
          "Type: ContextEntered, Prose: #{prose || '(none)'}"
        end
      end

      ContextExited = Struct.new :prose do
        def digest
          "Type: ContextExited, Prose: #{prose || '(none)'}"
        end
      end

      ErrorRaised = Struct.new :error do
        def digest
          "Type: ErrorRaised, Error: #{error.class}, Message: #{error.message.inspect}"
        end
      end

      FileEntered = Struct.new :path do
        def digest
          "Type: FileEntered, Path: #{path}"
        end
      end

      FileExited = Struct.new :path do
        def digest
          "Type: FileExited, Path: #{path}"
        end
      end

      Finished = Class.new do
        def digest
          "Type: Finished"
        end
      end

      Started = Class.new do
        def digest
          "Type: Started"
        end
      end

      TestFailed = Struct.new :prose, :error do
        def digest
          "Type: TestFailed, Prose: #{prose || '(none)'}, Error: #{error.class}, Message: #{error.message.inspect}"
        end
      end

      TestFinished = Struct.new :prose do
        def digest
          "Type: TestFinished, Prose: #{prose || '(none)'}"
        end
      end

      TestPassed = Struct.new :prose do
        def digest
          "Type: TestPassed, Prose: #{prose || '(none)'}"
        end
      end

      TestSkipped = Struct.new :prose do
        def digest
          "Type: TestSkipped, Prose: #{prose || '(none)'}"
        end
      end

      TestStarted = Struct.new :prose do
        def digest
          "Type: TestStarted, Prose: #{prose || '(none)'}"
        end
      end
    end
  end
end
