module TestBench
  color_scheme = ExtendedLogger::ColorScheme.build(
    :fatal => { :fg => :white, :bg => :red },
    :error => :red,
    :warn => :brown,
    # :info
    :debug => :cyan,
  )
  InternalLogger = ExtendedLogger.define color_scheme: color_scheme

  def self.internal_logger
    @internal_logger ||=
      begin
        if ENV['TEST_BENCH_INTERNAL_LOGGING'] == 'on'
          device = $stderr
        else
          device = '/dev/null'
        end
        InternalLogger.build device
      end

  end
end
