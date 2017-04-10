module TestBench
  class Output
    class Display
      class Error
        module FilterBacktrace
          def self.call backtrace
            backtrace = backtrace.reject do |frame|
              frame.start_with? root
            end

            backtrace
          end

          def self.root
            ::File.expand_path '../../../', __dir__
          end
        end
      end
    end
  end
end
