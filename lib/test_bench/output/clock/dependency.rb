module TestBench
  class Output
    module Clock
      module Dependency
        def clock
          @clock ||= Substitute.new
        end
        attr_writer :clock

        Substitute = Struct.new :now
      end
    end
  end
end
