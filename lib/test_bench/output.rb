module TestBench
  class Output
    include Extension::Output

    handle Context::Entered do |event|
      text = event.prose

      return if text.nil?

      if puts text, fg: :green
        self.indentation += 1
      end
    end
  end
end
