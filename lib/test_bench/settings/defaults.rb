module TestBench
  class Settings
    module Defaults
      def self.abort_on_error
        false
      end

      def self.color
        false
      end

      def self.default_file_pattern
        'tests/**/*.rb'
      end

      def self.exclude_pattern
        '_init.rb$'
      end

      def self.logger
        false
      end

      def self.reverse_backtraces
        false
      end

      def self.verbose
        false
      end
    end
  end
end
