require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Commented" do
      context "Color" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :verbose

        device = StringIO.new

        Controls::Output::Write.configure structure, color: true, device: device

        event = Controls::Event.commented

        structure.(event)

        test "White" do
          control_string = "#{TerminalColors::Apply.('Some comment', fg: :white)}\n"

          assert device.string == control_string
        end
      end
    end
  end
end
