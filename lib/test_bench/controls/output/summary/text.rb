module TestBench
  module Controls
    module Output
      module Summary
        module Text
          def self.example fg: nil, errors: nil, files: nil, tests: nil
            errors ||= 0
            errors = 1 if errors == true

            files ||= Summary.files
            tests ||= Summary.tests

            if errors == 1
              error_text = "1 total error"
            else
              error_text = "#{errors} total errors"
            end

            if files == 1
              files_text = "1 file"
            else
              files_text = "#{files} files"
            end

            tests_per_second = '%0.2f' % Rational(tests, Summary.elapsed_time)

            if tests == 1
              tests_text = "1 test"
            else
              tests_text = "#{tests} tests"
            end

            control_text = "Finished running #{files_text}\n"

            control_text << TerminalColors::Apply.(<<~TEXT.chomp, fg: fg)
            Ran #{tests_text} in 0.001s (#{tests_per_second} tests/second)
            4 passed, 5 failed, 6 skipped, #{error_text}
            TEXT

            control_text << "\n"

            control_text
          end
        end
      end
    end
  end
end
