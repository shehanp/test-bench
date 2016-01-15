module TestBench
  class CLI
    class ProcessSet
      class Process
        attr_reader :file
        attr_reader :parent_read_io
        attr_reader :child_write_io

        def initialize file, parent_read_io, child_write_io
          @file = file
          @parent_read_io = parent_read_io
          @child_write_io = child_write_io
        end

        def self.build file
          parent_read_io, child_write_io = IO.pipe

          instance = new file, parent_read_io, child_write_io
          instance
        end

        def child_process
          Signal.trap 'INT' do exit 1 end

          parent_read_io.close

          TestBench.logger.info file.dup

          begin
            load file

            exit 0

          ensure
            TestBench.internal_logger.debug do
              "Writing closing message (File: #{file.inspect})"
            end

            child_write_io.write "\x00"

            TestBench.internal_logger.debug do
              "Wrote closing message (File: #{file.inspect})"
            end
          end
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
