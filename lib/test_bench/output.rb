module TestBench
  class Output
    include Extension::Handle

    def self.call run
      instance = build

      run.add_subscriber instance
    end

    def configure
      self.write = Write.build
    end

    def write
      @write ||= Write.new
    end
    attr_writer :write

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

    handle ContextEntered do |event|
      text = event.prose

      return if text.nil?

      if write.(text, fg: :green)
        write.increase_indentation
      end
    end

    handle ContextExited do |event|
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

    handle TestStarted do |event|
      text = event.prose || Defaults.test_prose

      if write.(text, level: :verbose, fg: :black, bold: true)
        write.increase_indentation
      end
    end

    handle TestFailed do |event|
      text = event.prose || Defaults.test_prose

      write.(text, fg: :white, bg: :red, bold: true)
    end

    handle TestPassed do |event|
      text = event.prose || Defaults.test_prose

      write.(text, fg: :green)
    end

    handle TestSkipped do |event|
      text = event.prose || Defaults.test_prose

      write.(text, fg: :yellow)
    end

    handle TestFinished do |event|
      write.decrease_indentation if output_level == :verbose
    end
  end
end
