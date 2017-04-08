module TestBench
  class Run
    module Event
      def self.define *attributes, &block
        cls = Struct.new *attributes, :event_type

        cls.class_exec do
          include Event

          extend EventType

          prepend Initialize

          include Digest
        end

        cls.class_exec &block unless block.nil?

        cls
      end

      module Digest
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
      end

      module Initialize
        def initialize *;
          super

          self.event_type ||= self.class.event_type
        end
      end

      module EventType
        def event_type
          *, namespace = name.split '::'

          StringCasing::Underscore.(namespace)

          namespace.to_sym
        end
      end
    end
  end
end
