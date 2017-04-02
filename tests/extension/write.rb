require_relative '../test_init'

context "Extension" do
  context "Write" do
    output_device = StringIO.new

    extension = TestBench::Extension::Example.new
    extension.output_device = output_device

    extension.write 'some text'

    test "Text is written to output device" do
      assert output_device.string == 'some text'
    end
  end
end
