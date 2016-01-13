module TestBench
  class CLI
    class Runner
      attr_reader :confguration
      attr_reader :paths

      def initialize paths, confguration
        @confguration = confguration
        @paths = paths
      end

      def self.call paths
        confguration ||= Configuration.instance

        instance = new paths, confguration
        instance.()
      end

      def call
        TestBench.internal_logger.debug do
          "Files: #{files * ', '}"
        end

        set = ProcessSet.build files
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
        pattern = confguration.exclude_pattern

        files.reject do |file|
          pattern.match file
        end
      end
    end
  end
end
