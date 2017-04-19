require_relative '../../test_init'

context "Output" do
  context "Exit Status" do
    context "Error Raised" do
      exit_status = TestBench::Output::ExitStatus.new
      exit_status.nesting = 1

      error_raised = Controls::Event.error_raised
      assert error_raised.error.is_a?(StandardError)

      exit_status.(error_raised)

      test "Error is set" do
        assert exit_status.error == error_raised.error
      end
    end
  end
end
