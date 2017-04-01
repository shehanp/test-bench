module TestBench
  class Run
    module Event
      module File
        Entered = Struct.new :path
        Exited = Struct.new :path
      end

      module Context
        Entered = Struct.new :prose
        Exited = Struct.new :prose
      end

      module Test
        Entered = Struct.new :prose
        Exited = Struct.new :prose
        Passed = Struct.new :prose
        Failed = Struct.new :prose
        Skipped = Struct.new :prose
      end

      Started = Object.new
      Finished = Object.new

      Asserted = Object.new
      Commented = Struct.new :prose
      ErrorRaised = Struct.new :error
    end
  end
end
