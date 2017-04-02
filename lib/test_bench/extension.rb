module TestBench
  module Extension
    def self.included cls
      cls.class_exec do
        extend Handle::Macro

        include Run::Event
        include Run::Subscriber

        include Handle
      end
    end
  end
end
