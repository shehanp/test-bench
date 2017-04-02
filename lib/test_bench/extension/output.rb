module TestBench
  module Extension
    module Output
      def self.included cls
        cls.class_exec do
          include Extension

          prepend Configure

          setting :output_level
          def output_level
            @output_level ||= :normal
          end
        end
      end

      def output_device
        @output_device ||= StringIO.new
      end
      attr_writer :output_device

      def puts text
        unless output_level == :quiet
          write text
          write $/
        end
      end

      def write text
        output_device.write text
      end

      def verbose text
        if output_level == :verbose
          puts text
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
