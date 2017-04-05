module TestBench
  class Output
    module Handlers
      class Structure
        include Handle
        include Run::Event

        handle ContextEntered do |event|
          return if event.prose.nil?

          if write.(event.prose, fg: :green)
            write.increase_indentation
          end
        end

        handle ContextExited do |event|
          unless event.prose.nil? || write.output_level == Settings::OutputLevel.silent
            write.decrease_indentation
          end
        end

        handle TestStarted do |event|
          prose = event.prose || Defaults.test_prose

          if write.(prose, level: Settings::OutputLevel.verbose, fg: :black, bold: true)
            write.increase_indentation
          end
        end

        handle TestFinished do |event|
          prose = event.prose || Defaults.test_prose

          write.(prose, fg: :green)

          if write.output_level == Settings::OutputLevel.verbose
            write.decrease_indentation
          end
        end
      end
    end
  end
end
