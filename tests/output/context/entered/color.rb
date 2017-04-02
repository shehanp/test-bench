require_relative '../../../test_init'

context "Output" do
  context "Context" do
    context "Entered" do
      context "Color" do
        event = TestBench::Run::Event::Context::Entered.new 'Some context'

        output = TestBench::Output.new
        output.color = true

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Prose is written in green" do
          control_string = TerminalColors::Apply.("Some context", fg: :green)

          assert output_device.string.chomp == control_string
        end
      end
    end
  end
end
