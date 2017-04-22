require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "Test Failed" do
      test_failed = Controls::Event.test_failed

      summary = TestBench::Output::Summary.new
      summary.(test_failed)

      test "Number of skipped tests is increased" do
        assert summary.tests_failed == 1
      end
    end
  end
end
