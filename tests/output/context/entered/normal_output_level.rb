require_relative '../../../test_init'

context "Output" do
  context "Context" do
    context "Entered" do
      context "Normal Output Level" do
        event = TestBench::Run::Event::Context::Entered.new 'Some context'

        output = TestBench::Output.new

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Prose is written" do
          assert output_device.string == "Some context\n"
        end

        test "Indentation is increased" do
          assert output.indentation == 1
        end
      end
    end
  end
end
