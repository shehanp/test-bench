require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Commented" do
      context "Verbose" do
        handle = TestBench::Output::Structure.new
        handle.output_level = :verbose

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.commented

        handle.(event)

        test "Comment is written" do
          assert device.string == "Some comment\n"
        end
      end
    end
  end
end
