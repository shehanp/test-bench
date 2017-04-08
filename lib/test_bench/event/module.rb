module TestBench
  module Event
    module Module
      def self.included cls
        cls.class_exec do
          prepend Initialize

          extend EventType
        end
      end

      def digest
        str = String.new

        *members, event_type = self.members
        members.unshift event_type

        members.each do |member|
          label = StringCasing::Pascal.(member.to_s)

          value = __send__ member

          str << ', ' unless str.empty?
          str << "#{label}: #{value.inspect}"
        end

        str
      end

      module Initialize
        def initialize *;
          super

          self.event_type ||= self.class.event_type
        end
      end

      module EventType
        def event_type
          return nil if name.nil?

          *, namespace = name.split '::'

          StringCasing::Underscore.(namespace)

          namespace.to_sym
        end
      end
    end
  end
end
