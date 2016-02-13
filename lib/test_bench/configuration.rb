module TestBench
  class Configuration
    attr_writer :child_count
    attr_accessor :fail_fast
    attr_reader :env
    attr_writer :exclude_pattern
    attr_writer :spec_compatibility
    attr_writer :verbosity

    def initialize env
      @env = env
    end

    def self.build
      new ENV
    end

    def self.instance
      @instance ||= build
    end

    def activated? value
      TrueValues.include? value
    end

    def child_count
      @child_count ||=
        begin
          value = env['TEST_BENCH_CHILD_COUNT'.freeze]
          value ||= 1
          Integer(value)
        end
    end

    def decrease_verbosity
      Logging.registry.lower_verbosity
    end

    def exclude_pattern
      @exclude_pattern ||=
        begin
          value = env['TEST_BENCH_EXCLUDE_PATTERN'.freeze]
          value ||= '^$'
          Regexp.new value
        end
    end

    def fail_fast?
      return true if fail_fast
      value = env['TEST_BENCH_FAIL_FAST'.freeze]
      activated? value
    end

    def increase_verbosity
      Logging.registry.increase_verbosity
    end

    def spec_compatibility
      @spec_compatibility ||=
        begin
          value = env['TEST_BENCH_SPEC_COMPATIBILITY'.freeze] || 'off'.freeze
          TrueValues.include? value
        end
    end

    def to_h
      {
        child_count: child_count,
        exclude_pattern: exclude_pattern,
        fail_fast: fail_fast,
        spec_compatibility: spec_compatibility,
      }
    end

    FalseValues = %w(off n no 0).map &:freeze
    TrueValues = %w(on y yes 1).map &:freeze
  end
end
