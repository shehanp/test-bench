require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Puts" do
      extension = TestBench::Extension::Output::Example.new

      context do
        extension.output_device = output_device = StringIO.new

        extension.puts 'some text'

        test "Text is written" do
          assert output_device.string == "some text\n"
        end
      end

      context "Output level is quiet" do
        extension.output_level = :quiet

        extension.output_device = output_device = StringIO.new

        extension.puts 'some text'

        test "Text is not written" do
          assert output_device.string == ''
        end
      end
    end
  end
end
