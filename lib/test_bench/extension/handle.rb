module TestBench
  module Extension
    module Handle
      def handle event
        handler_method_name = Handle::MethodName.get event.class

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
  end
end
