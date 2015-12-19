module TestBench
  class CLI
    attr_reader :argv
    attr_reader :options

    def initialize argv, options
      @argv = argv
      @options = options
    end

    def self.call argv=nil
      argv ||= []

      options = Options.build

      instance = new argv, options
      instance.call
    end

    def call
      parser.parse! argv

      InternalLogger.data do
        require 'json'
        json = JSON.pretty_generate options.to_h
        "Test bench options:\n#{json}"
      end

      paths = argv
      paths << 'tests' if paths.empty?
      InternalLogger.info "Running test scripts in #{paths * ', '}"

      Runner.(paths, options) or exit 1
    end

    def parser
      OptionParser.new do |parser|
        parser.on '-f', '--fail-fast' do
          options.fail_fast = true
        end

        parser.on '-h', '--help', 'Print this help message and exit successfully' do
          puts parser
          exit 0
        end

        parser.on '-n', '--child-count NUM' do |number|
          options.child_count = Integer(number)
        end

        parser.on '-q', '--quiet', 'Decrease verbosity level' do
          options.decrease_verbosity
        end

        parser.on '-r', '--reverse-backtraces', 'Reverse line ordering of backtraces' do
          options.reverse_backtraces = true
        end

        parser.on '-v', '--verbose', 'Increase verbosity level' do
          options.increase_verbosity
        end

        parser.on '-V', '--version', 'Print version and exit successfully' do
          puts "test-bench (#{parser.program_name}) version #{version}"
          exit 0
        end
      end
    end

    def version
      spec = Gem.loaded_specs['test_bench']

      if spec
        spec.version
      else
        '(local)'.freeze
      end
    end
  end
end
