module TestBench
  class Output
    class Write
      include Settings::Macro

      setting :color

      def device
        @device ||= StringIO.new
      end
      attr_writer :device

      def indentation
        @indentation ||= 0
      end
      attr_writer :indentation

      setting :output_level
      def output_level
        @output_level ||= OutputLevel.normal
      end

      def self.build
        device = Defaults.device
        settings = Settings.build

        instance = new
        instance.device = device
        settings.set instance
        instance
      end

      def call text, level: nil, **color_arguments
        level ||= Defaults.level

        return unless write? level

        output = String.new

        indentation.times do
          output << '  '
        end

        if color
          text = TerminalColors::Apply.(text, **color_arguments)
        end

        output << text

        output << $/

        device.write output

        output
      end

      def decrease_indentation
        self.indentation -= 1
      end

      def increase_indentation
        self.indentation += 1
      end

      def write?(message_level)
        case message_level
        when OutputLevel.silent
          true
        when OutputLevel.normal
          output_level != OutputLevel.silent
        when OutputLevel.verbose
          output_level == OutputLevel.verbose
        end
       end

      OutputLevel = Settings::OutputLevel

      module Defaults
        def self.device
          $stdour
        end

        def self.level
          OutputLevel.normal
        end
      end
    end
  end
end
