module TestBench
  class Output
    class Write
      module Dependency
        def write
          @write ||= Write.new
        end
        attr_writer :write
      end
    end
  end
end
