require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Skipped" do
      event = TestBench::Run::Event::Test::Skipped.new 'Some test'

      output = TestBench::Output.new

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Prose is written" do
        assert output_device.string == "Some test\n"
      end
    end
  end
end
