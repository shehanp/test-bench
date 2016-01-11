module TestBench
  module SpecDSL
    def self.activate
      Object.send :include, SpecDSL
    end

    # Care has been taken in these methods to reduce the size of backtraces in
    # output. Hence, the design of the internal implementation is highly
    # suspect. However the overall win is that backtrace filtering is utterly
    # unnecessary, which is a beneficial simplification.
    %i(context test describe it specify).each do |method_name|
      define_method method_name do |message=nil, &block|
        test_block = %i(it specify test).include? method_name

        begin
          unless test_block
            TestBench.logger.heading message
            TestBench.formatter.indent
          end

          block.()

          TestBench.logger.pass message if test_block
          nil

        rescue => error
          begin
            Fiber.yield error
          rescue FiberError
            raise error
          end

        ensure
          TestBench.formatter.deindent unless test_block
          TestBench.logger.fail message if test_block and error
        end
      end
    end
  end
end
