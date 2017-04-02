module TestBench
  class Settings
    module Environment
      class Set
        def env
          @env ||= ENV
        end
        attr_writer :env

        def output_device
          @output_device ||= $stdout
        end
        attr_writer :output_device

        attr_reader :receiver

        def initialize receiver
          @receiver = receiver
        end

        def self.build receiver
          instance = new receiver
          instance.env = ENV
          instance.output_device = $stdout
          instance
        end

        def self.call receiver
          instance = build receiver
          instance.()
        end

        def call
          set :abort_on_error, boolean('TEST_BENCH_ABORT_ON_ERROR')
          set :color, boolean('TEST_BENCH_COLOR'), output_device.tty?
          set :default_file_pattern, env['TEST_BENCH_DEFAULT_FILE_PATTERN']
          set :exclude_pattern, env['TEST_BENCH_EXCLUDE_PATTERN']
          set :logger, boolean('TEST_BENCH_LOGGER')
          set :reverse_backtraces, boolean('TEST_BENCH_REVERSE_BACKTRACES')
          set :silent, boolean('TEST_BENCH_SILENT')
          set :verbose, boolean('TEST_BENCH_VERBOSE')
        end

        def set name, *values
          values.each do |value|
            unless value.nil?
              receiver.public_send "#{name}=", value
              break
            end
          end
        end

        def boolean key
          case env[key]
          when %r{\A(?:on|y|yes|t|true|1)\z}i then true
          when %r{\A(?:off|n|no|f|false|0)\z}i then false
          when nil then nil
          else
            raise ArgumentError, "Environment variable ENV[#{key.inspect}] is set to #{env[key].inspect}, which is not a boolean value"
          end
        end
      end
    end
  end
end
