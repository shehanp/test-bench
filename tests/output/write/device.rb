require_relative '../../test_init'

context "Output" do
  context "Write" do
    context "Device" do
      context do
        write = TestBench::Output::Write.new
        write.device = device = StringIO.new

        result = write.('some text')

        test "Text is written to output device" do
          assert device.string == "some text\n"
        end

        test "Written text is returned" do
          assert result == device.string
        end
      end

      context "Filtered message" do
        write = TestBench::Output::Write.new
        write.device = device = StringIO.new

        result = write.('some text', level: :verbose)

        test "Nothing is written to output device" do
          assert device.string == ''
        end

        test "Nil is returned" do
          assert result == nil
        end
      end
    end
  end
end
