module TestBench
  class Output
    module BacktraceFilter
      class ExampleError < StandardError
        def self.build message=nil
          message ||= 'Some error'

          instance = new message
          instance.set_backtrace backtrace
          instance
        end

        def self.backtrace
          [
            %[#{test_bench_lib}/test_bench/some_file.rb:4:in `qux'],
            %[path/to/file.rb:3:in `baz'],
            %[#{test_bench_lib}/test_bench/some_file.rb:2:in `bar'],
            %[path/to/file.rb:1:in `foo']
          ]
        end

        def self.filtered
          <<~TEXT
          path/to/file.rb:3:in `baz': Some error (#{self})
                  from path/to/file.rb:1:in `foo'
          TEXT
        end

        def self.reversed
          <<~TEXT
                  from path/to/file.rb:1:in `foo'
                  from #{test_bench_lib}/test_bench/some_file.rb:2:in `bar'
                  from path/to/file.rb:3:in `baz'
          #{test_bench_lib}/test_bench/some_file.rb:4:in `qux': Some error (#{self})
          TEXT
        end

        def self.unfiltered
          <<~TEXT
          #{test_bench_lib}/test_bench/some_file.rb:4:in `qux': Some error (#{self})
                  from path/to/file.rb:3:in `baz'
                  from #{test_bench_lib}/test_bench/some_file.rb:2:in `bar'
                  from path/to/file.rb:1:in `foo'
          TEXT
        end

        def self.test_bench_lib
          File.expand_path '../lib', __dir__
        end
      end
    end
  end
end
