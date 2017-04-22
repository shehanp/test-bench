require_relative '../../../test_init'

context "Output" do
  context "Summary" do
    context "Finished" do
      summary = Controls::Output::Summary.example

      device = StringIO.new

      Controls::Output::Write.configure summary, device: device

      finished = Controls::Event.finished
      summary.(finished)

      test "Finish time is set" do
        finish_time = Controls::Output::Summary.finish_time

        assert summary.finish_time == finish_time
      end

      test "Summary is written" do
        assert device.string == Controls::Output::Summary::Text.example
      end
    end
  end
end
