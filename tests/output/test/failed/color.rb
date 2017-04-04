require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Failed" do
      context "Color" do
        event = TestBench::Run::Event::TestFailed.new 'Some test'

        output = TestBench::Output.new
        output.color = true

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Prose is written in white on red" do
          control_string = "#{TerminalColors::Apply.('Some test', fg: :white, bg: :red, bold: true)}\n"

          assert output_device.string == control_string
        end
      end
    end
  end
end
