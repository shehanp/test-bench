module TestBench
  module Extension
    module Handle
      def self.included cls
        cls.class_exec do
          extend Build

          extend Macro

          include Run::Event
          include Run::Subscriber

          include HandleMethod
        end
      end

      def configure
      end

      module HandleMethod
        def handle event
          handler_method_name = MethodName.get event.class

          return unless methods.include? handler_method_name

          handler_method = method handler_method_name

          case handler_method.arity
          when 0
            handler_method.()
          when 1
            handler_method.(event)
          else
            raise ArgumentError, "Extension handlers must be of arity 0 or 1, not #{handler_method.arity}"
          end
        end
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
end
