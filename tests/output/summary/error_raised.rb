require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "Error Raised" do
      error_raised = Controls::Event.error_raised
      error = error_raised.error or fail

      summary = TestBench::Output::Summary.new
      summary.(error_raised)

      test "Number of errors is increased" do
        assert summary.errors == 1
      end
    end
  end
end
