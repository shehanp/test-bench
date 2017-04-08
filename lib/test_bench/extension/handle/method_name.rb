module TestBench
  module Extension
    module Handle
      module MethodName
        def self.get event_or_event_class
          if event_or_event_class.is_a? Class
            event_class = event_or_event_class
          else
            event_class = event_or_event_class.class
          end

          *, namespace = event_class.name.split '::'

          underscore_case = StringCasing::Underscore.(namespace)

          :"handle_#{underscore_case}"
        end
      end
    end
  end
end
