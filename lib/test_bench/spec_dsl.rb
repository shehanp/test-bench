module TestBench
  module SpecDSL
    def self.activate
      Object.send :include, SpecDSL
    end

    def self.enter message=nil, &block
      old_sentence = self.sentence || ''.freeze
      sentence = old_sentence.dup

      if message
        sentence << ' ' unless sentence.empty?
        sentence << message
      end

      self.sentence = sentence
      old_sentence
    end

    def self.sentence
      Thread.current[:spec_dsl_sentence]
    end

    def self.sentence= sentence
      Thread.current[:spec_dsl_sentence] = sentence
    end

    # Care has been taken in these methods to reduce the size of backtraces in
    # output. Hence, the design of the internal implementation is highly
    # suspect. However the overall win is that backtrace filtering is utterly
    # unnecessary, which is a beneficial simplification.
    %i(context describe it specify).each do |method_name|
      define_method method_name do |message=nil, &block|
        log = %i(it specify).include? method_name

        begin
          old_sentence = SpecDSL.enter message

          block.()

          Logger.pass SpecDSL.sentence if log
          nil

        rescue => error
          Fiber.yield error
          Logger.fail SpecDSL.sentence if log

        ensure
          SpecDSL.sentence = old_sentence
        end
      end
    end
  end
end
