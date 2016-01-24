module TestBench
  class CLI
    attr_reader :argv
    attr_reader :configuration

    def initialize argv, configuration
      @argv = argv
      @configuration = configuration
    end

    def self.call argv=nil
      argv ||= []

      configuration = Configuration.instance

      instance = new argv, configuration
      instance.call
    end

    def call
      parser.parse! argv

      TestBench.logger.level += configuration.log_level

      TestBench.internal_logger.debug do
        require 'json'
        json = JSON.pretty_generate configuration.to_h
        "Test bench configuration:\n#{json}"
      end

      paths = argv
      paths << 'tests' if paths.empty?
      TestBench.internal_logger.info "Running test scripts in #{paths * ', '}"

      TestBench.activate

      Runner.(paths) or exit 1
    end

    def parser
      OptionParser.new do |parser|
        parser.on '-c', '--spec-compatibility', 'Enable minimal compatibility with other spec frameworks' do
          configuration.spec_compatibility = true
        end

        parser.on '-f', '--fail-fast', 'Exit immediately after any test script fails' do
          configuration.fail_fast = true
        end

        parser.on '-h', '--help', 'Print this help message and exit successfully' do
          puts parser
          exit 0
        end

        parser.on '-I', '--include DIR', 'Adds DIR to the ruby load path before test run' do |dir|
          $LOAD_PATH.unshift dir unless $LOAD_PATH.include? dir
        end

        parser.on '-n', '--child-count NUM', 'Maximum number of processes to run in parallel' do |number|
          configuration.child_count = Integer(number)
        end

        parser.on '-q', '--quiet', 'Decrease verbosity level' do
          configuration.decrease_verbosity
        end

        parser.on '-r', '--require LIBRARY', 'Requires a LIBRARY before test run' do |library|
          require library
        end

        parser.on '-v', '--verbose', 'Increase verbosity level' do
          configuration.increase_verbosity
        end

        parser.on '-V', '--version', 'Print version and exit successfully' do
          puts "test-bench (#{parser.program_name}) version #{version}"
          exit 0
        end

        parser.on '-x', '--exclude PATTERN', 'Filter out files matching PATTERN' do |pattern|
          configuration.exclude_pattern = Regexp.new pattern
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
