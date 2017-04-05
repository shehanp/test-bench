module TestBench
  module Controls
    module Output
      module Handle
        def self.example
          Example.new
        end

        class Example
          include TestBench::Output::Handle

          handle Run::Event::ContextEntered do |_|
            @handled_context_entered = true
          end

          def handled_context_entered?
            @handled_context_entered ? true : false
          end

          handle Run::Event::ContextExited do |_|
            @handled_context_exited = true
          end

          def handled_context_exited?
            @handled_context_exited ? true : false
          end

          handle Run::Event::TestStarted do |_|
            @handled_test_started = true
          end

          def handled_test_started?
            @handled_test_started ? true : false
          end

          handle Run::Event::TestFinished do |_|
            @handled_test_finished = true
          end

          def handled_test_finished?
            @handled_test_finished ? true : false
          end
        end
      end
    end
  end
end

