module TestBench
  module Extension
    module Output
      def self.included cls
        cls.class_exec do
          include Extension

          prepend Configure

          setting :color
          setting :output_level
        end
      end

      def indentation
        @indentation ||= 0
      end
      attr_writer :indentation

      def output_device
        @output_device ||= StringIO.new
      end
      attr_writer :output_device

      def puts text, fg: nil, bg: nil
        if output_level == :quiet
          false
        else
          output = String.new

          indentation.times do
            output << '  '
          end

          if color
            text = TerminalColors::Apply.(text, fg: fg, bg: bg)
          end

          output << text

          output << $/

          write output

          true
        end
      end

      def write text
        output_device.write text
      end

      def verbose text, fg: nil, bg: nil
        if output_level == :verbose
          puts text, fg: fg, bg: bg
          true
        else
          false
        end
      end

      module Configure
        def configure
          self.output_device = $stdout
          super
        end
      end
    end
  end
end
