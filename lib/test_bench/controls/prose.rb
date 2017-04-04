module TestBench
  module Controls
    module Event
      module Prose
        def self.example value=nil, default: nil
          default ||= 'Some prose'

          if value == :none
            nil
          else
            value || default
          end
        end
      end
    end
  end
end
