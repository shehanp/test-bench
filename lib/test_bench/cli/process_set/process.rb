module TestBench
  class CLI
    class ProcessSet
      class Process
        attr_reader :file
        attr_reader :reverse_backtraces
        attr_reader :parent_read_io
        attr_reader :child_write_io

        def initialize file, reverse_backtraces, parent_read_io, child_write_io
          @file = file
          @reverse_backtraces = reverse_backtraces
          @parent_read_io = parent_read_io
          @child_write_io = child_write_io
        end

        def self.build file, reverse_backtraces=nil
          reverse_backtraces ||= false
          parent_read_io, child_write_io = IO.pipe

          instance = new file, reverse_backtraces, parent_read_io, child_write_io
          instance
        end

        def child_process
          Signal.trap 'INT' do exit 1 end

          parent_read_io.close

          TestBench.logger.info file

          begin
            exit_status = 0
            filter_line_no = __LINE__ ; fiber = Fiber.new do load file; nil end

            while error = fiber.resume
              print_stacktrace error, filter_line_no
              exit_status = 1
            end

            exit exit_status

          rescue => error
            print_stacktrace error, filter_line_no
            exit 1

          ensure
            TestBench.internal_logger.debug do
              "Writing closing message (File: #{file.inspect})"
            end

            child_write_io.write "\x00"

            TestBench.internal_logger.debug do
              "Wrote closing message (File: #{file.inspect})"
            end

            TestBench.logger.pass ''
          end

          exit 0
        end

        def fd
          parent_read_io
        end

        def finish
          return if process_exited?

          TestBench.internal_logger.debug "Reading closing message (File: #{file.inspect})"
          parent_read_io.read 1
          TestBench.internal_logger.info "Read closing message (File: #{file.inspect})"

          TestBench.internal_logger.debug "Waiting for process to close (File: #{file.inspect})"
          _, status = ::Process.wait2 pid
          status = status.exitstatus
          TestBench.internal_logger.info "Process closed (File: #{file.inspect}, Status: #{status.inspect})"

          status == 0
        end

        def pid
          @pid ||= fork do
            child_process
          end
        end

        def print_stacktrace error, filter_line_no
          backtrace = error.backtrace_locations

          backtrace = backtrace.take_while do |location|
            start_filtering = [
              location.lineno == filter_line_no,
              location.absolute_path == __FILE__,
            ].all?

            not start_filtering
          end

          first_line = "#{backtrace.shift}: #{error} (#{error.class})"

          lines = backtrace.map do |location|
            "\tfrom #{location}"
          end
          lines.unshift first_line

          if reverse_backtraces
            lines.reverse!
          end

          $stderr.puts lines
        end

        def process_exited?
          if signal 0 then false else true end
        end

        def signal signal
          ::Process.kill signal, pid
          true
        rescue Errno::ESRCH
          false
        end

        def start
          pid
          child_write_io.close
          freeze
        end

        def term
          signal 'TERM'
        end
      end
    end
  end
end
