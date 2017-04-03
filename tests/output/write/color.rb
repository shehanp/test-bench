require_relative '../../test_init'

context "Output" do
  context "Write" do
    context "Color" do
      write = TestBench::Output::Write.new

      context "Setting is enabled" do
        write.color = true

        output = write.('some text', fg: :green, bg: :black, bold: true)

        test "Color is applied to text" do
          control_string = "#{TerminalColors::Apply.('some text', fg: :green, bg: :black, bold: true)}\n"

          assert output == control_string
        end
      end

      context "Setting is disabled" do
        write.color = false

        output = write.('some text', fg: :green, bg: :black, bold: true)

        test "Color is not applied to text" do
          assert output == "some text\n"
        end
      end
    end
  end
end
