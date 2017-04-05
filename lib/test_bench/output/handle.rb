module TestBench
  class Output
    module Handle
      def self.included cls
        cls.class_exec do
          include Extension::Handle
          include Write::Dependency

          prepend HandlerMethods
        end
      end

      def handle_context_entered _
      end

      def handle_context_exited _
      end

      def handle_test_started _
      end

      def handle_test_finished _
      end

      module HandlerMethods
        def handle_context_entered event
          super

          unless event.prose.nil? || write.output_level == :silent
            write.increase_indentation
          end
        end

        def handle_context_exited event
          super

          unless event.prose.nil? || write.output_level == :silent
            write.decrease_indentation
          end
        end

        def handle_test_finished _
          super

          if write.output_level == :verbose
            write.decrease_indentation
          end
        end

        def handle_test_started _
          super

          if write.output_level == :verbose
            write.increase_indentation
          end
        end
      end
    end
  end
end
