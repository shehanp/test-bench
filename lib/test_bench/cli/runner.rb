module TestBench
  class CLI
    class Runner
      attr_reader :options
      attr_reader :paths

      def initialize paths, options
        @options = options
        @paths = paths
      end

      def self.call paths, options=nil
        options ||= Options.build

        instance = new paths, options
        instance.()
      end

      def call
        InternalLogger.data do
          "Files: #{files * ', '}"
        end

        set = ProcessSet.build files, options

        Signal.trap 'INT' do set.shutdown end

        set.()
      end

      def expand_paths
        paths.flat_map do |path|
          if path.end_with? '.rb'
            path
          else
            Dir["#{path}/**/*.rb"]
          end
        end
      end

      def files
        @files ||= filter expand_paths
      end

      def filter files
        files.reject do |file|
          options.exclude_pattern.match file
        end
      end
    end
  end
end
