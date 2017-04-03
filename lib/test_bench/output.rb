module TestBench
  class Output
    include Extension::Handle

    def write
      @write ||= Write.new
    end



    def indentation
      write.indentation
    end

    def indentation= i
      write.indentation = i
    end

    def color= color
      write.color = color
    end

    def output_level
      write.output_level
    end

    def output_level= level
      write.output_level = level
    end

    def output_device= device
      write.device = device
    end

    def self.call(run)
      run.add_subscriber build
    end

    setting :reverse_backtraces

    handle Commented do |event|
      write.(event.prose, level: :verbose, fg: :white)
    end

    handle Context::Entered do |event|
      text = event.prose

      return if text.nil?

      if write.(text, fg: :green)
        write.increase_indentation
      end
    end

    handle Context::Exited do |event|
      unless output_level == :silent || event.prose.nil?
        write.decrease_indentation
      end
    end

    handle ErrorRaised do |event|
      error = event.error

      backtrace = error.backtrace

      unless output_level == :verbose
        backtrace = FilterBacktrace.(backtrace)
      end

      message_line = "#{backtrace[0]}: #{error.message} (#{error.class})"

      lines = backtrace[1..-1].map do |frame|
        "        from #{frame}"
      end

      if reverse_backtraces
        lines.reverse_each do |line|
          write.(line, fg: :red)
        end
      end

      write.(message_line, level: :silent, fg: :red)

      unless reverse_backtraces
        lines.each do |line|
          write.(line, fg: :red)
        end
      end
    end

    handle Test::Started do |event|
      text = event.prose || Defaults.test_prose

      if write.(text, level: :verbose, fg: :black, bold: true)
        write.increase_indentation
      end
    end

    handle Test::Failed do |event|
      text = event.prose || Defaults.test_prose

      write.(text, fg: :white, bg: :red, bold: true)
    end

    handle Test::Passed do |event|
      text = event.prose || Defaults.test_prose

      write.(text, fg: :green)
    end

    handle Test::Skipped do |event|
      text = event.prose || Defaults.test_prose

      write.(text, fg: :yellow)
    end

    handle Test::Finished do |event|
      write.decrease_indentation if output_level == :verbose
    end
  end
end
