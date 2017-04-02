require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Finished" do
      event = TestBench::Run::Event::Test::Finished.new 'Some test'

      output = TestBench::Output.new

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Nothing is written" do
        assert output_device.string == ''
      end

      test "Indentation is unchanged" do
        assert output.indentation == 0
      end
    end
  end
end
