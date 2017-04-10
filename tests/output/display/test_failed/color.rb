require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Test Failed" do
      context "Color" do
        handle = TestBench::Output::Display.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device, color: true

        event = Controls::Event.test_failed

        handle.(event)

        test "Prose is written in white on red" do
          control_string = "#{TerminalColors::Apply.('Some test', fg: :white, bg: :red, bold: true)}\n"

          assert device.string == control_string
        end
      end
    end
  end
end
