require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Puts" do
      extension = TestBench::Extension::Output::Example.new

      context do
        extension.output_device = output_device = StringIO.new

        result = extension.puts 'some text'

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

        result = extension.puts 'some text'

        test "Text is not written" do
          assert output_device.string == ''
        end

        test "False is returned" do
          assert result == false
        end
      end

      context "Color" do
        extension.output_level = :normal
        extension.color = true

        extension.output_device = output_device = StringIO.new

        result = extension.puts 'some text', fg: :green, bg: :black

        test "Text is written" do
          control_string = "#{TerminalColors::Apply.('some text', fg: :green, bg: :black)}\n"

          assert output_device.string == control_string
        end
      end
    end
  end
end
