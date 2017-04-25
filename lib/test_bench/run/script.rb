module TestBench
  class Run
    class Script
      attr_reader :context
      attr_reader :ruby_source

      def initialize ruby_source, context
        @ruby_source = ruby_source
        @context = context
      end

      def self.build path
        ruby_source = File.read path
        context = TOPLEVEL_BINDING.receiver

        new ruby_source, context
      end

      def self.call path
        instance = build path
        instance.()
      end

      def call
        context.instance_eval ruby_source

        true

      rescue SystemExit => system_exit
        return system_exit.status == 0
      end
    end
  end
end
