require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "Test Skipped" do
      test_skipped = Controls::Event.test_skipped

      summary = TestBench::Output::Summary.new
      summary.(test_skipped)

      test "Number of skipped tests is increased" do
        assert summary.tests_skipped == 1
      end
    end
  end
end
