require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Commented" do
      context "Verbose" do
        handle = TestBench::Output::Display.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device, output_level: :verbose

        event = Controls::Event.commented

        handle.(event)

        test "Comment is written" do
          assert device.string == "Some comment\n"
        end
      end
    end
  end
end
