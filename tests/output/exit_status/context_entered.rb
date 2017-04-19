require_relative '../../test_init'

context "Output" do
  context "Exit Status" do
    context "Context Entered" do
      context_entered = Controls::Event.context_entered

      exit_status = TestBench::Output::ExitStatus.new
      assert exit_status.nesting == 0

      exit_status.(context_entered)

      test "Nesting is increased" do
        assert exit_status.nesting == 1
      end
    end
  end
end
