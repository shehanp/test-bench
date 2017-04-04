module TestBench
  class Output
    module Handlers
      class Commented
        include Extension::Handle
        include Write::Dependency

        handle Run::Event::Commented do |event|
          write.(event.prose, level: :verbose, fg: :white)
        end
      end
    end
  end
end
