module TestBench
  module Bootstrap
    def self.activate
      main = TOPLEVEL_BINDING.receiver

      indent_level = 0

      indent = proc { |prose=nil, fg: nil, bg: nil, &block|
        unless prose.nil?
          prose = TerminalColors::Apply.(prose, fg: fg, bg: bg)

          print '  ' * indent_level
          puts prose
        end

        indent_level += 1

        begin
          block.() unless block.nil?
        ensure
          indent_level -=1
        end
      }

      main.singleton_class.class_exec do
        define_method :context do |prose=nil, &block|
          indent.(prose, fg: :green) do
            block.() unless block.nil?
          end
        end

        alias_method :test, :context

        define_method :assert do |expression_result|
          unless expression_result
            indent.("Assertion failed: #{caller[0]}", fg: :red)
            exit 1
          end
        end

        define_method :refute do |expression_result|
          if expression_result
            indent.("Assertion failed: #{caller[0]}", fg: :red)
            exit 1
          end
        end
      end
    end
  end
end
