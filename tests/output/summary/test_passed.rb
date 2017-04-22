require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "Test Passed" do
      test_passed = Controls::Event.test_passed

      summary = TestBench::Output::Summary.new
      summary.(test_passed)

      test "Number of tests passed is increased" do
        assert summary.tests_passed == 1
      end
    end
  end
end
