require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Entered" do
      context "Color" do
        structure = TestBench::Output::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device, color: true

        event = Controls::Event.context_entered

        structure.(event)

        test "Prose is written in green" do
          control_string = TerminalColors::Apply.("Some Context", fg: :green)

          assert device.string.chomp == control_string
        end
      end
    end
  end
end
