require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "Test Finished" do
      test_finished = Controls::Event.test_finished

      summary = TestBench::Output::Summary.new
      summary.(test_finished)

      test "Number of tests is increased" do
        assert summary.tests == 1
      end
    end
  end
end
