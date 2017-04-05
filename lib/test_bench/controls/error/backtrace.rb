module TestBench
  module Controls
    module Error
      module Backtrace
        def self.example
          [
            %[#{test_bench_lib}/test_bench/some_file.rb:4:in `qux'],
            %[#{Path.example}:3:in `baz'],
            %[#{test_bench_lib}/test_bench/some_file.rb:2:in `bar'],
            %[#{Path.example}:1:in `foo']
          ]
        end

        def self.test_bench_lib
          File.expand_path '../lib', __dir__
        end

        module Text
          def self.filtered
            <<~TEXT
            #{Path.example}:3:in `baz': Some error (#{Example})
                    from #{Path.example}:1:in `foo'
            TEXT
          end

          def self.reversed
            <<~TEXT
                    from #{Path.example}:1:in `foo'
            #{Path.example}:3:in `baz': Some error (#{Example})
            TEXT
          end

          def self.unfiltered
            <<~TEXT
            #{Backtrace.test_bench_lib}/test_bench/some_file.rb:4:in `qux': Some error (#{Example})
                    from #{Path.example}:3:in `baz'
                    from #{Backtrace.test_bench_lib}/test_bench/some_file.rb:2:in `bar'
                    from #{Path.example}:1:in `foo'
            TEXT
          end

          def self.reversed_unfiltered
            <<~TEXT
                    from #{Path.example}:1:in `foo'
                    from #{Backtrace.test_bench_lib}/test_bench/some_file.rb:2:in `bar'
                    from #{Path.example}:3:in `baz'
            #{Backtrace.test_bench_lib}/test_bench/some_file.rb:4:in `qux': Some error (#{Example})
            TEXT
          end
        end
      end
    end
  end
end
