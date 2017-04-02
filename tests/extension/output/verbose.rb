require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Verbose" do
      extension = TestBench::Extension::Output::Example.new

      context "Output level is verbose" do
        extension.output_level = :verbose

        extension.output_device = output_device = StringIO.new

        extension.verbose 'some text'

        test "Text is written" do
          assert output_device.string == "some text\n"
        end
      end

      context "Output level is silent" do
        extension.output_level = :silent

        extension.output_device = output_device = StringIO.new

        extension.verbose 'some text'

        test "Text is not written" do
          assert output_device.string == ''
        end
      end

      context "Output level is normal" do
        extension.output_level = :silent

        extension.output_device = output_device = StringIO.new

        extension.verbose 'some text'

        test "Text is not written" do
          assert output_device.string == ''
        end
      end
    end
  end
end
