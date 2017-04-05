module TestBench
  class Output
    module Handle
      def self.included cls
        cls.class_exec do
          include Extension::Handle
          include Write::Dependency
        end
      end
    end
  end
end
