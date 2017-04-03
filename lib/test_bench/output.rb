module TestBench
  class Output
    include Extension
    include Extension::Output

    setting :reverse_backtraces

    handle Commented do |event|
      verbose event.prose, fg: :white
    end

    handle Context::Entered do |event|
      text = event.prose

      return if text.nil?

      if puts text, fg: :green
        increase_indentation
      end
    end

    handle Context::Exited do |event|
      unless output_level == :silent || event.prose.nil?
        decrease_indentation
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
          puts line, fg: :red
        end
      end

      write_line message_line, fg: :red

      unless reverse_backtraces
        lines.each do |line|
          puts line, fg: :red
        end
      end
    end

    handle Test::Started do |event|
      text = event.prose || Defaults.test_prose

      if verbose text, fg: :black, bold: true
        increase_indentation
      end
    end

    handle Test::Failed do |event|
      text = event.prose || Defaults.test_prose

      puts text, fg: :white, bg: :red, bold: true
    end

    handle Test::Passed do |event|
      text = event.prose || Defaults.test_prose

      puts text, fg: :green
    end

    handle Test::Skipped do |event|
      text = event.prose || Defaults.test_prose

      puts text, fg: :yellow
    end

    handle Test::Finished do |event|
      decrease_indentation if output_level == :verbose
    end
  end
end
