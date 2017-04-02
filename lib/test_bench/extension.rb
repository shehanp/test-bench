module TestBench
  module Extension
    def self.included cls
      cls.class_exec do
        extend Build
        extend Handle::Macro

        include Run::Event
        include Run::Subscriber

        prepend Configure

        include Handle
      end
    end

    def configure
    end

    def output_device
      @output_device ||= StringIO.new
    end
    attr_writer :output_device

    def write *arguments
      output_device.write *arguments
    end

    module Build
      def build
        instance = new
        instance.configure
        instance
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
