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
        TestBench.internal_logger.debug do
          "Files: #{files * ', '}"
        end

        set = ProcessSet.build files, options
        set.()
      end

      def expand_paths
        paths.flat_map do |path|
          if path.end_with? '.rb'
            path
          else
            glob = File.join path, '**/*.rb'
            Dir[glob]
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
