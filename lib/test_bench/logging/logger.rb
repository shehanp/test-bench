module TestBench
  module Logging
    color_scheme = ExtendedLogger::ColorScheme.build(
      :fail => { :fg => :white, :bg => :red },
      # :summary
      :error => :red,
      :skip => :brown,
      :step => :green,
      # :info
      :detail => :cyan,
    )

    levels = ExtendedLogger::Level::Set.build(
      %i(detail info step skip error summary fail),
      :default => :info,
    )

    format = -> message do
      Indent.instance.(message)
    end

    logger_class = ExtendedLogger.define(
      levels,
      :color_scheme => color_scheme,
      :format => format,
    )

    Logger = logger_class

    class Logger
      def indent
        Indent.instance.increase_indentation
      end

      def deindent
        Indent.instance.decrease_indentation
      end
    end
  end
end
