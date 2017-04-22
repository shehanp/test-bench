require_relative '../../test_init'

context "Output" do
  context "Write" do
    context "Configure" do
      receiver = OpenStruct.new

      write = TestBench::Output::Write.configure receiver

      test "Write instance is returned" do
        assert write.instance_of?(TestBench::Output::Write)
      end

      test "Writer is set" do
        assert receiver.write == write
      end

      test "Text is written to output device" do
        assert write.device == $stdout
      end
    end
  end
end
