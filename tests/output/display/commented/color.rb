require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Commented" do
      context "Color" do
        handle = TestBench::Output::Display.new

        device = StringIO.new

        Controls::Output::Write.configure handle, color: true, device: device, output_level: :verbose

        event = Controls::Event.commented

        handle.(event)

        test "White" do
          control_string = "#{TerminalColors::Apply.('Some comment', fg: :white)}\n"

          assert device.string == control_string
        end
      end
    end
  end
end
