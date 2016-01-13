module TestBench
  module Structure
    def self.activate
      Object.send :include, self
    end

    def context message=nil, &block
      indented = false

      if message
        TestBench.logger.step do
          indented = true
          message
        end
      end

      TestBench.logger.indent if indented

      # If TestBench's logger is compromised during the execution, restore it.
      # This is mainly useful for scripts that test TestBench itself.
      old_logger = TestBench.logger

      Structure.increase_nesting

      begin
        block.() if block

      ensure
        TestBench.logger = old_logger
        TestBench.logger.deindent if indented

        Structure.decrease_nesting
        if Structure.top_level? and Structure.errors.any?
          exit 1
        end
      end
    end

    def test message=nil, &block
      message ||= 'Test'
      if block
        context message do

          begin
            block.()

          rescue => error
            if error.is_a? Assert::Failure
              TestBench.logger.fail "Test #{message.inspect} failed"
            else
              TestBench.logger.error "#{error.class}: #{error.message}"
              lines = error.backtrace_locations

              lines.reverse! if Configuration.instance.reverse_backtraces?

              lines.each do |line|
                TestBench.logger.error do
                  "    from #{line}"
                end
              end

              TestBench.logger.fail "Test #{message.inspect} errored out"
            end

            if Configuration.instance.fail_fast?
              exit 1
            elsif Structure.top_level?
              raise error
            else
              Structure.errors << error
            end
          end
        end
      else
        context message
      end
    end

    class << self
      attr_writer :nesting

      def decrease_nesting
        self.nesting -= 1
      end

      def errors
        @errors ||= []
      end

      def increase_nesting
        self.nesting += 1
      end

      def nesting
        @nesting ||= 0
      end

      def top_level?
        nesting == 0
      end
    end
  end
end
