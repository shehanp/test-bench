require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Skipped" do
      context "Color" do
        handle = TestBench::Output::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device, color: true

        event = Controls::Event.test_skipped

        handle.(event)

        test "Prose is written in yellow" do
          control_string = "#{TerminalColors::Apply.('Some test', fg: :yellow)}\n"

          assert device.string == control_string
        end
      end
    end
  end
end
