require_relative '../../test_init'

context "Output" do
  context "Comment" do
    context "Color" do
      event = TestBench::Run::Event::Commented.new 'Some comment'

      output = TestBench::Output.new
      output.color = true

      output.output_level = :verbose

      output.output_device = output_device = StringIO.new

      output.handle event

      test "White" do
        control_string = "#{TerminalColors::Apply.('Some comment', fg: :white)}\n"

        assert output_device.string == control_string
      end
    end
  end
end
