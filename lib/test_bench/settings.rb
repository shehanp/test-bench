module TestBench
  class Settings
    def self.build
      instance = new
      Environment::Set.(instance)
      instance
    end

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

    def logger
      nil_coalesce :@logger, Defaults.logger
    end
    attr_writer :logger

    def output_level
      if silent
        OutputLevel.silent
      elsif verbose
        OutputLevel.verbose
      else
        OutputLevel.normal
      end
    end

    def silent
      nil_coalesce :@silent, Defaults.silent
    end
    attr_writer :silent

    def reverse_backtraces
      nil_coalesce :@reverse_backtraces, Defaults.reverse_backtraces
    end
    attr_writer :reverse_backtraces

    def verbose
      nil_coalesce :@verbose, Defaults.verbose
    end
    attr_writer :verbose

    def set receiver
      invalid_settings = receiver.settings - public_methods(false)

      if invalid_settings.any?
        raise InvalidSettingError, "Cannot apply unknown settings: #{invalid_settings.map(&:inspect) * ', '}"
      end

      receiver.settings.each do |attribute|
        value = __send__ attribute

        setter = "#{attribute}="

        receiver.public_send setter, value
      end
    end

    def nil_coalesce ivar, value
      unless instance_variable_defined? ivar
        instance_variable_set ivar, value
      end

      instance_variable_get ivar
    end

    InvalidSettingError = Class.new StandardError
  end
end
