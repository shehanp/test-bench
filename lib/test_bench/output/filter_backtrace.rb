module TestBench
  class Output
    module FilterBacktrace
      def self.call backtrace
        backtrace = backtrace.reject do |frame|
          root = ::File.expand_path '..', __dir__

          frame.start_with? root
        end

        backtrace
      end
    end
  end
end
