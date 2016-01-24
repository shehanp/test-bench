module TestBench
  class Runner
    attr_reader :base_path
    attr_reader :exclude_pattern
    attr_reader :paths

    def initialize paths, base_path, exclude_pattern
      @base_path = base_path
      @exclude_pattern = exclude_pattern
      @paths = paths
    end

    def self.call paths, base_path: nil, exclude_pattern: nil
      base_path ||= Pathname.new(caller[0]).dirname.expand_path
      exclude_pattern ||= /^$/

      paths = Array(paths)

      instance = new paths, base_path, exclude_pattern
      instance.()
    end

    def call
      TestBench.internal_logger.debug do
        "Files: #{files * ', '}"
      end

      set = ProcessSet.build files

      passed = set.()

      TestBench.internal_logger.debug do
        "Result: #{passed}"
      end

      passed
    end

    def expand_paths
      paths.flat_map do |path|
        full_path = base_path.join path

        unless full_path.extname == '.rb'
          full_path = full_path.join '**/*.rb'
        end

        Dir[full_path]
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
