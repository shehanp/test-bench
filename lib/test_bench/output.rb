module TestBench
  class Output
    include Extension::Output

    handle Context::Entered do |event|
      text = event.prose

      return if text.nil?

      if puts text, fg: :green
        increase_indentation
      end
    end

    handle Context::Exited do |event|
      decrease_indentation unless output_level == :quiet
    end
  end
end
