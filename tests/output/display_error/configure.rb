require_relative '../../test_init'

context "Output" do
  context "Display Error" do
    context "Configure" do
      receiver = OpenStruct.new

      display_error = TestBench::Output::DisplayError.configure receiver

      test "Display error instance is returned" do
        assert display_error.instance_of?(TestBench::Output::DisplayError)
      end

      test "Display error is set" do
        assert receiver.display_error == display_error
      end

      test "Text is written to output device" do
        assert display_error.device == $stdout
      end
    end
  end
end
