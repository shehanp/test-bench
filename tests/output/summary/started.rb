require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "Started" do
      started = Controls::Event.started

      time = Controls::Time.example

      summary = TestBench::Output::Summary.new
      summary.clock.now = time

      summary.(started)

      test "Start time is set" do
        assert summary.start_time == time
      end
    end
  end
end
