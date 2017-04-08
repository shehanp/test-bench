module TestBench
  class Output
    module Handlers
      class Structure
        include Extension::Handle
        include Event

        include Write::Dependency

        def display_error
          @display_error ||= DisplayError.new
        end
        attr_writer :display_error

        def configure
          self.write = writer = Write.build
          self.display_error = DisplayError.build writer: writer
        end

        handle Commented do |event|
          write.(event.prose, level: Settings::OutputLevel.verbose, fg: :white)
        end

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

        handle ErrorRaised do |event|
          display_error.(event.error)
        end

        handle TestStarted do |event|
          prose = event.prose || Defaults.test_prose

          if write.(prose, level: Settings::OutputLevel.verbose, fg: :black, bold: true)
            write.increase_indentation
          end
        end

        handle TestFailed do |event|
          prose = event.prose || Defaults.test_prose

          write.(prose, fg: :white, bg: :red, bold: true)
        end

        handle TestFinished do |event|
          prose = event.prose || Defaults.test_prose

          write.(prose, fg: :green)

          if write.output_level == Settings::OutputLevel.verbose
            write.decrease_indentation
          end
        end

        handle TestPassed do |event|
          prose = event.prose || Defaults.test_prose

          write.(prose, fg: :green)
        end

        handle TestSkipped do |event|
          text = event.prose || Defaults.test_prose

          write.(text, fg: :yellow)
        end
      end
    end
  end
end
