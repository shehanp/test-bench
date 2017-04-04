require_relative '../../../test_init'

context "Output" do
  context "Context" do
    context "Exited" do
      event = TestBench::Run::Event::ContextExited.new 'Some context'

      output = TestBench::Output.new
      output.indentation = 1

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Nothing is written" do
        assert output_device.string == ''
      end

      test "Indentation is decreased" do
        assert output.indentation == 0
      end
    end
  end
end
