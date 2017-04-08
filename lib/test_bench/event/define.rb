module TestBench
  module Event
    def self.define *attributes, &block
      cls = Struct.new *attributes, :event_type

      cls.class_exec do
        include Module
      end

      cls.class_exec &block unless block.nil?

      cls
    end
  end
end
