module TestBench
  module Logging
    class Indent
      attr_writer :indentation

      def call message
        indent message.prose
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

      def self.instance
        @instance ||= new
      end
    end
  end
end
