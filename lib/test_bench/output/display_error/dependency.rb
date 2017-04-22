module TestBench
  class Output
    class DisplayError
      module Dependency
        def display_error
          @display_error ||= DisplayError.new
        end
        attr_writer :display_error
      end
    end
  end
end
