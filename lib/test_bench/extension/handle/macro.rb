module TestBench
  module Extension
    module Handle
      module Macro
        def handle cls, &block
          method_name = MethodName.get cls

          define_method method_name, &block
        end
      end
    end
  end
end
