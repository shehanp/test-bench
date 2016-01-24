module TestBench
  module Logging
    class Logger < ExtendedLogger
      self.levels = %w(DEBUG INFO ERROR STEP SKIP FAIL)

      attr_writer :indenter

      def self.build *;
        indenter = Indenter.new

        instance = super
        instance.indenter = indenter
        instance
      end

      def deindent
        indenter.decrease_indentation
      end

      def formatter
        @formatter ||= ExtendedLogger::Formatter.new indenter
      end

      def indent
        indenter.increase_indentation
      end

      def indentation
        indenter.indentation
      end

      def indentation= value
        indenter.indentation = value
      end

      def indenter
        @indenter ||= Indenter.new
      end

      class Indenter
        attr_writer :indentation

        def call severity, datetime, progname, message
          if message == '(empty log message)'.freeze
            indent "\n"
          else
            indent "#{message}\n"
          end
        end

        def decrease_indentation
          self.indentation -= 1
        end

        def increase_indentation
          self.indentation += 1
        end

        def indentation
          @indentation ||= 0
        end

        def indent text
          output = '  '.freeze * indentation
          output << text
          output
        end
      end
    end
  end
end
