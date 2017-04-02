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

          namespace = event_class.name

          namespace = namespace.sub Pattern.namespace, ''

          underscore_case = namespace.gsub Pattern.separator do |str|
            str.downcase!

            if str.length == 4
              str.gsub! '::', '_'
            elsif str.length == 2
              str.insert 1, '_'
            end

            str
          end

          :"handle_#{underscore_case}"
        end

        module Pattern
          def self.namespace
            @namespace ||= %r{\A#{Regexp.escape Run::Event.name}::}
          end

          def self.separator
            @separator ||= %r{(?:\A|[a-z0-9](?:::)?)[A-Z]}
          end
        end
      end
    end
  end
end
