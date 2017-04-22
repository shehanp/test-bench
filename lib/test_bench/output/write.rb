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

      def self.build settings: nil
        settings ||= Settings.build

        instance = new
        instance.device = Defaults.device
        settings.set instance
        instance
      end

      def self.configure receiver, *arguments
        instance = build *arguments

        receiver.public_send :write=, instance

        instance
      end

      def call text, **color_arguments
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

      def decrease_indentation &block
        self.indentation -= 1

        if indentation.zero?
          block.() unless block.nil?
        end

        indentation
      end

      def increase_indentation
        self.indentation += 1
      end

      module Defaults
        def self.device
          $stdout
        end
      end
    end
  end
end
