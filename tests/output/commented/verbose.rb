require_relative '../../test_init'

context "Output" do
  context "Commented" do
    context "Verbose" do
      event = TestBench::Run::Event::Commented.new 'Some comment'

      output = TestBench::Output.new

      output.output_level = :verbose

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Comment is written" do
        assert output_device.string == "Some comment\n"
      end
    end
  end
end
