require_relative '../../test_init'

context "Output" do
  context "Exit Status" do
    context "Context Exited" do
      context_exited = Controls::Event.context_exited

      context "Outer context" do
        context "Error" do
          exit_status = TestBench::Output::ExitStatus.new
          exit_status.nesting = 1
          exit_status.error = Controls::Error.example

          test "SystemExit is raised with nonzero status" do
            begin
              exit_status.(context_exited)
            rescue SystemExit => system_exit
            end

            refute system_exit.nil?
            refute system_exit.status == 0
          end
        end

        context "No Error" do
          exit_status = TestBench::Output::ExitStatus.new
          exit_status.nesting = 1

          context "Outermost context is exited" do
            test "SystemExit is not raised" do
              begin
                exit_status.(context_exited)
              rescue SystemExit => system_exit
              end

              assert system_exit.nil?
            end
          end
        end
      end

      context "Inner context" do
        exit_status = TestBench::Output::ExitStatus.new
        exit_status.nesting = 2
        exit_status.error = Controls::Error.example

        test "SystemExit is not raised" do
          begin
            exit_status.(context_exited)
          rescue SystemExit => system_exit
          end

          assert system_exit.nil?
        end

        test "Nesting is decreased" do
          assert exit_status.nesting == 1
        end
      end
    end
  end
end
