module TestBench
  module Controls
    module Extension
      module Handler
        def self.example
          Example.build
        end

        class Example
          include TestBench::Extension::Handle
        end
      end
    end
  end
end
