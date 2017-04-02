require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Verbose" do
      extension = TestBench::Extension::Output::Example.new

      context "Output level is verbose" do
        extension.output_level = :verbose

        extension.output_device = output_device = StringIO.new

        result = extension.verbose 'some text'

        test "Text is written" do
          assert output_device.string == "some text\n"
        end

        test "True is returned" do
          assert result == true
        end
      end

      context "Output level is silent" do
        extension.output_level = :silent

        extension.output_device = output_device = StringIO.new

        result = extension.verbose 'some text'

        test "Text is not written" do
          assert output_device.string == ''
        end

        test "False is returned" do
          assert result == false
        end
      end

      context "Output level is normal" do
        extension.output_level = :silent

        extension.output_device = output_device = StringIO.new

        result = extension.verbose 'some text'

        test "Text is not written" do
          assert output_device.string == ''
        end

        test "False is returned" do
          assert result == false
        end
      end

      context "Color" do
        extension.output_level = :verbose
        extension.color = true

        extension.output_device = output_device = StringIO.new

        result = extension.verbose 'some text', fg: :green, bg: :black

        test "Text is written" do
          control_string = "#{TerminalColors::Apply.('some text', fg: :green, bg: :black)}\n"

          assert output_device.string == control_string
        end
      end
    end
  end
end
