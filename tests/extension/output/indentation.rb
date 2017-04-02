require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Indentation" do
      extension = TestBench::Extension::Output::Example.new

      context "0" do
        extension.indentation = 0
        extension.output_device = output_device = StringIO.new

        extension.puts 'Some text'

        test "Output text is not indented" do
          assert output_device.string == "Some text\n"
        end
      end

      context "1" do
        extension.indentation = 1
        extension.output_device = output_device = StringIO.new

        extension.puts 'Some text'

        test "Output text is indented with two spaces" do
          assert output_device.string == "  Some text\n"
        end
      end

      context "2" do
        extension.indentation = 2
        extension.output_device = output_device = StringIO.new

        extension.puts 'Some text'

        test "Output text is indented with four spaces" do
          assert output_device.string == "    Some text\n"
        end
      end

      context "Color" do
        extension.indentation = 1
        extension.color = true
        extension.output_device = output_device = StringIO.new

        extension.puts 'Some text', fg: :green

        test "Color is applied to text, not indentation" do
          control_string = "  #{TerminalColors::Apply.('Some text', fg: :green)}\n"

          assert output_device.string == control_string
        end
      end
    end
  end
end
