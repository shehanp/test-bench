require_relative '../../../test_init'

context "Output" do
  context "Context" do
    context "Exited" do
      context "No Prose" do
        event = TestBench::Run::Event::ContextExited.new

        output = TestBench::Output.new
        output.indentation = 1

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Indentation is unchanged" do
          assert output.indentation == 1
        end
      end
    end
  end
end
