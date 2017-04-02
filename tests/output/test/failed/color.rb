require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Failed" do
      context "Color" do
        event = TestBench::Run::Event::Test::Failed.new 'Some test'

        output = TestBench::Output.new
        output.color = true

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Prose is written in red" do
          control_string = "#{TerminalColors::Apply.('Some test', fg: :red)}\n"

          assert output_device.string == control_string
        end
      end
    end
  end
end
