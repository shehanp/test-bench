module TestBench
  module Extension
    module Output
      class Example
        include Extension::Handle
        include Output
      end
    end
  end
end
