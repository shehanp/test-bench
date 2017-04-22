module TestBench
  class Output
    class DisplayError
      include Settings::Macro
      include Write::Dependency

      setting :output_level
      setting :reverse_backtraces

      def self.build writer: nil, settings: nil
        settings ||= Settings.build
        writer ||= Write.build settings: settings

        instance = new
        instance.write = writer
        settings.set instance
        instance
      end

      def self.configure receiver, *arguments
        instance = build *arguments

        receiver.public_send :display_error=, instance

        instance
      end

      def self.call error, *arguments
        instance = build *arguments
        instance.(error)
      end

      def call error
        backtrace = self.backtrace error

        message_line = "#{backtrace[0]}: #{error.message} (#{error.class})"

        lines = [message_line]

        unless output_level == Settings::OutputLevel.silent
          backtrace[1..-1].each do |frame|
            lines << "        from #{frame}"
          end
        end

        lines.reverse! if reverse_backtraces

        lines.each do |line|
          write.(line, fg: :red)
        end
      end

      def backtrace error
        if output_level == Settings::OutputLevel.verbose
          error.backtrace
        else
          FilterBacktrace.(error.backtrace)
        end
      end

      def device
        write.device
      end
    end
  end
end
