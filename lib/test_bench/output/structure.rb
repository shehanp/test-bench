module TestBench
  class Output
    class Structure
      include Extension::Handle
      include Write::Dependency
      include DisplayError::Dependency

      include Event

      setting :output_level
      def output_level
        @output_level ||= Settings::OutputLevel.normal
      end

      def configure
        writer = Write.configure self

        DisplayError.configure self, writer: writer
      end

      handle Commented do |event|
        if output_level == Settings::OutputLevel.verbose
          write.(event.prose, fg: :white)
        end
      end

      handle ContextEntered do |event|
        return if event.prose.nil?

        unless output_level == Settings::OutputLevel.silent
          write.(event.prose, fg: :green)
          write.increase_indentation
        end
      end

      handle ContextExited do |event|
        unless event.prose.nil? || output_level == Settings::OutputLevel.silent
          write.decrease_indentation do
            write.('')
          end
        end
      end

      handle ErrorRaised do |event|
        display_error.(event.error)
      end

      handle TestStarted do |event|
        prose = event.prose || Defaults.test_prose

        if output_level == Settings::OutputLevel.verbose
          write.(prose, fg: :black, bold: true)

          write.increase_indentation
        end
      end

      handle TestFailed do |event|
        prose = event.prose || Defaults.test_prose

        unless output_level == Settings::OutputLevel.silent
          write.(prose, fg: :white, bg: :red, bold: true)
        end
      end

      handle TestFinished do |event|
        prose = event.prose || Defaults.test_prose

        if output_level == Settings::OutputLevel.verbose
          write.decrease_indentation
        end
      end

      handle TestPassed do |event|
        prose = event.prose || Defaults.test_prose

        unless output_level == Settings::OutputLevel.silent
          write.(prose, fg: :green)
        end
      end

      handle TestSkipped do |event|
        text = event.prose || Defaults.test_prose

        unless output_level == Settings::OutputLevel.silent
          write.(text, fg: :yellow)
        end
      end
    end
  end
end
