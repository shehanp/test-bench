require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Color" do
      extension = TestBench::Extension::Output::Example.new

      context "Setting is enabled" do
        extension.color = true

        extension.output_device = output_device = StringIO.new

        result = extension.puts 'some text', fg: :green, bg: :black

        test "Color is applied to text" do
          control_string = "#{TerminalColors::Apply.('some text', fg: :green, bg: :black)}\n"

          assert output_device.string == control_string
        end
      end

      context "Setting is disabled" do
        extension.color = false

        extension.output_device = output_device = StringIO.new

        result = extension.puts 'some text', fg: :green, bg: :black

        test "Color is not applied to text" do
          assert output_device.string == "some text\n"
        end
      end
    end
  end
end
