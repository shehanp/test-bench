require_relative '../../../test_init'

context "Output" do
  context "Summary" do
    context "Finished" do
      context "Silent" do
        summary = TestBench::Output::Summary.new
        summary.output_level = :silent

        finished = Controls::Event.finished

        device = StringIO.new

        Controls::Output::Write.configure summary, device: device

        summary.(finished)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
