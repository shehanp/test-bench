require_relative '../../test_init'

context "Output" do
  context "Exit Status" do
    context "Abort On Error" do
      exit_status = TestBench::Output::ExitStatus.new
      exit_status.abort_on_error = true
      exit_status.error = Controls::Error.example
      exit_status.nesting = 2

      context "Test Finished" do
        test_finished = Controls::Event.test_finished

        test "System Exit is raised with nonzero status" do
          begin
            exit_status.(test_finished)
          rescue SystemExit => system_exit
          end

          refute system_exit.nil?
          refute system_exit.status == 0
        end
      end

      context "Context Exited" do
        context_exited = Controls::Event.context_exited

        test "System Exit is raised with nonzero status" do
          begin
            exit_status.(context_exited)
          rescue SystemExit => system_exit
          end

          refute system_exit.nil?
          refute system_exit.status == 0
        end
      end
    end
  end
end
