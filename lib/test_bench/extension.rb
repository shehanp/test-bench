module TestBench
  module Extension
    def self.included cls
      cls.class_exec do
        extend Build
        extend Handle::Macro

        include Run::Event
        include Run::Subscriber

        include Handle
      end
    end

    def configure
    end

    module Build
      def build
        instance = new
        instance.configure
        instance
      end
    end
  end
end
