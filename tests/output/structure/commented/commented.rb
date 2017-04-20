require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Commented" do
      context "Verbose" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :verbose

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device

        event = Controls::Event.commented

        structure.(event)

        test "Comment is written" do
          assert device.string == "Some comment\n"
        end
      end
    end
  end
end
