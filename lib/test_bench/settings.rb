module TestBench
  class Settings
    def abort_on_error
      nil_coalesce :@abort_on_error, Defaults.abort_on_error
    end
    attr_writer :abort_on_error

    def color
      nil_coalesce :@color, Defaults.color
    end
    attr_writer :color

    def default_file_pattern
      nil_coalesce :@default_file_pattern, Defaults.default_file_pattern
    end
    attr_writer :default_file_pattern

    def exclude_pattern
      nil_coalesce :@exclude_pattern, Defaults.exclude_pattern
    end
    attr_writer :exclude_pattern

    def reverse_backtraces
      nil_coalesce :@reverse_backtraces, Defaults.reverse_backtraces
    end
    attr_writer :reverse_backtraces

    def verbose
      nil_coalesce :@verbose, Defaults.verbose
    end
    attr_writer :verbose

    def nil_coalesce ivar, value
      unless instance_variable_defined? ivar
        instance_variable_set ivar, value
      end

      instance_variable_get ivar
    end
  end
end
