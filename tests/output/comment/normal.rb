require_relative '../../test_init'

context "Output" do
  context "Comment" do
    context "Normal output level" do
      event = TestBench::Run::Event::Commented.new 'Some comment'

      output = TestBench::Output.new

      output.output_level = :normal

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Nothing is written" do
        assert output_device.string == ''
      end
    end
  end
end
