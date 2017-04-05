module TestBench
  class Output
    module Handlers
      class Commented
        include Handle
        include Run::Event

        handle Commented do |event|
          write.(event.prose, level: :verbose, fg: :white)
        end
      end
    end
  end
end
