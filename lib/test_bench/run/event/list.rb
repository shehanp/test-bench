module TestBench
  class Run
    module Event
      Asserted = Event.define
      AssertionPassed = Event.define
      AssertionFailed = Event.define

      Commented = Event.define :prose

      ContextEntered = Event.define :prose
      ContextExited = Event.define :prose

      ErrorRaised = Event.define :error

      FileEntered = Event.define :path
      FileExited = Event.define :path

      Finished = Event.define
      Started = Event.define

      TestFailed = Event.define :prose, :error
      TestFinished = Event.define :prose
      TestPassed = Event.define :prose
      TestSkipped = Event.define :prose
      TestStarted = Event.define :prose
    end
  end
end
