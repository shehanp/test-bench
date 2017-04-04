require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Started" do
      context "Color" do
        event = TestBench::Run::Event::TestStarted.new 'Some test'

        output = TestBench::Output.new
        output.color = true
        output.output_level = :verbose

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Prose is written in gray" do
          control_string = "#{TerminalColors::Apply.('Some test', fg: :black, bold: true)}\n"

          assert output_device.string == control_string
        end
      end
    end
  end
end
