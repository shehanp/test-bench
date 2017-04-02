require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Write" do
      extension = TestBench::Extension::Output::Example.new

      extension.output_device = output_device = StringIO.new
      extension.output_level = :quiet

      extension.write 'some text'

      test "Text is written to output device" do
        assert output_device.string == 'some text'
      end
    end
  end
end
