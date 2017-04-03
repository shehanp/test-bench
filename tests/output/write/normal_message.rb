require_relative '../../test_init'

context "Output" do
  context "Write" do
    context "Normal Message" do
      write = TestBench::Output::Write.new

      context "Silent output level" do
        write.output_level = :silent

        result = write.('some text', level: :normal)

        test "Nothing is returned" do
          assert result == nil
        end
      end

      context "Normal output level" do
        write.output_level = :normal

        result = write.('some text', level: :normal)

        test "Text is returned" do
          assert result == "some text\n"
        end
      end

      context "Verbose output level" do
        write.output_level = :verbose

        result = write.('some text', level: :normal)

        test "Text is returned" do
          assert result == "some text\n"
        end
      end
    end
  end
end
