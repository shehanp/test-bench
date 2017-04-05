module TestBench
  class Output
    include Extension::Handle
    include Run::Event

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

    handle ErrorRaised do |event|
      error = event.error

      backtrace = error.backtrace

      unless output_level == Settings::OutputLevel.verbose
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

      write.(message_line, level: Settings::OutputLevel.silent, fg: :red)

      unless reverse_backtraces
        lines.each do |line|
          write.(line, fg: :red)
        end
      end
    end
  end
end
