module TestBench
  class Runner
    class ProcessSet
      attr_reader :child_count
      attr_reader :fail_fast
      attr_reader :files
      attr_writer :passed

      def initialize files, child_count, fail_fast
        @child_count = child_count
        @fail_fast = fail_fast
        @files = files
      end

      def self.build files
        confguration = Configuration.instance

        child_count = confguration.child_count
        fail_fast = confguration.fail_fast?

        instance = new files, child_count, fail_fast
        instance
      end

      def call
        files.each do |file|
          wait child_count - 1 or return false

          child_process = spawn_child file
          set << child_process
        end

        wait 0

        passed?

      ensure
        shutdown
      end

      def failed?
        not passed?
      end

      def passed
        if instance_variable_defined? :@passed
          @passed
        else
          @passed = true
        end
      end
      alias_method :passed?, :passed

      def set
        @set ||= []
      end

      def wait max_count
        while set.size > max_count
          tick
          return false if failed? and fail_fast
        end
        true
      end

      def spawn_child file
        process = Process.build file
        process.start
        process
      end

      def tick
        TestBench.internal_logger.debug "Starting tick (Processes: #{set.size})"

        loop do
          reads, _, _ = IO.select set.map(&:fd), [], [], 10
          reap reads and break if reads
        end

        TestBench.internal_logger.info "Finished tick (Processes: #{set.size})"
        true
      end

      def reap reads=nil
        reads ||= []

        set.delete_if do |process|
          if process.process_exited? or reads.include? process.fd
            TestBench.internal_logger.debug "Reaping (File: #{process.file}, PID: #{process.pid})"
            process.finish or self.passed = false
            true
          end
        end
        set
      end

      def set
        @set ||= []
      end

      def shutdown
        reap

        set.each do |process|
          process.term
        end

        ::Process.waitall
      end

      def failed?
        not passed?
      end
    end
  end
end