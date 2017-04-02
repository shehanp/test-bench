module TestBench
  class Output
    include Extension::Output

    handle Commented do |event|
      verbose event.prose, fg: :white
    end

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

    handle Test::Started do |event|
      text = event.prose || Defaults.test_prose

      if verbose text, fg: :black, bold: true
        increase_indentation
      end
    end
  end
end
