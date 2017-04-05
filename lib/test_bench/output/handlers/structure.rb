module TestBench
  class Output
    module Handlers
      class Structure
        include Handle
        include Run::Event

        handle ContextEntered do |event|
          write.(event.prose, fg: :green) unless event.prose.nil?
        end

        handle TestStarted do |event|
          prose = event.prose || Defaults.test_prose

          write.(prose, level: :verbose, fg: :black, bold: true)
        end

        handle TestFinished do |event|
          prose = event.prose || Defaults.test_prose

          write.(prose, fg: :green)
        end
      end
    end
  end
end
