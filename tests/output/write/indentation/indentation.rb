require_relative '../../../test_init'

context "Output" do
  context "Write" do
    context "Indentation" do
      write = TestBench::Output::Write.new

      context "0" do
        write.indentation = 0

        output = write.('Some text')

        test "Output text is not indented" do
          assert output == "Some text\n"
        end
      end

      context "1" do
        write.indentation = 1

        output = write.('Some text')

        test "Output text is indented by two spaces" do
          assert output == "  Some text\n"
        end
      end

      context "2" do
        write.indentation = 2

        output = write.('Some text')

        test "Output text is indented by four spaces" do
          assert output == "    Some text\n"
        end
      end

      context "Color" do
        write.color = true
        write.indentation = 1

        output = write.('Some text', fg: :white, bg: :black, bold: true)

        test "Color is applied to text, not indentation" do
          control_string = "  #{TerminalColors::Apply.('Some text', fg: :white, bg: :black, bold: true)}\n"

          assert output == control_string
        end
      end
    end
  end
end
