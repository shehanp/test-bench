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
        Started = Struct.new :prose
        Finished = Struct.new :prose
        Passed = Struct.new :prose
        Failed = Struct.new :prose, :error
        Skipped = Struct.new :prose
      end

      module Assertion
        Asserted = Class.new
        Passed = Class.new
        Failed = Class.new
      end

      Started = Class.new
      Finished = Class.new

      Commented = Struct.new :prose
      ErrorRaised = Struct.new :error
    end
  end
end