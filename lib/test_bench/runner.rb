module TestBench
  class Runner
    attr_reader :exclude_pattern
    attr_reader :paths

    def initialize paths, exclude_pattern
      @exclude_pattern = exclude_pattern
      @paths = paths
    end

    def self.call paths, exclude_pattern: nil
      if exclude_pattern.nil?
        configuration = Configuration.instance
        exclude_pattern = configuration.exclude_pattern
      end

      paths = Array(paths)

      instance = new paths, exclude_pattern
      instance.()
    end

    def call
      TestBench.internal_logger.debug do
        "Files: #{files * ', '}"
      end

      set = ProcessSet.build files

      passed = set.()
      passed
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
        exclude_pattern.match file
      end
    end
  end
end
