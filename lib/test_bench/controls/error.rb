module TestBench
  module Controls
    module Error
      def self.example
        Example.build
      end

      class Example < StandardError
        def self.build message=nil
          message ||= 'Some error'

          instance = new message
          instance.set_backtrace Backtrace.example
          instance
        end
      end

      module Backtrace
        def self.example
          [
            %[#{test_bench_lib}/test_bench/some_file.rb:4:in `qux'],
            %[#{Path.example}:3:in `baz'],
            %[#{test_bench_lib}/test_bench/some_file.rb:2:in `bar'],
            %[#{Path.example}:1:in `foo']
          ]
        end

        module Text
          def self.example indentation: nil
            indentation ||= 0

            text = filtered

            lines = text.each_line.map do |line|
              "#{'  ' * indentation}#{line}\n"
            end

            lines.join
          end

          def self.filtered
            <<~TEXT
            #{Path.example}:3:in `baz': Some error (#{Example})
                    from #{Path.example}:1:in `foo'
            TEXT
          end

          def self.reversed
            <<~TEXT
                    from #{Path.example}:1:in `foo'
                    from #{test_bench_lib}/test_bench/some_file.rb:2:in `bar'
                    from #{Path.example}:3:in `baz'
            #{test_bench_lib}/test_bench/some_file.rb:4:in `qux': Some error (#{Example})
            TEXT
          end

          def self.unfiltered
            <<~TEXT
            #{test_bench_lib}/test_bench/some_file.rb:4:in `qux': Some error (#{Example})
                    from #{Path.example}:3:in `baz'
                    from #{test_bench_lib}/test_bench/some_file.rb:2:in `bar'
                    from #{Path.example}:1:in `foo'
            TEXT
          end

          def self.test_bench_lib
            File.expand_path '../lib', __dir__
          end
        end
      end
    end
  end
end
