require_relative '../../test_init'

context "Output" do
  context "Display Error" do
    context "Silent output level" do
      error = Controls::Error.example

      device = StringIO.new

      display_error = TestBench::Output::DisplayError.new
      display_error.output_level = :silent

      Controls::Output::Write.configure display_error, device: device

      display_error.(error)

      test "Error message is written without remainder of backtrace" do
        control_string = Controls::Error::Backtrace::Text.filtered.each_line.first

        assert device.string == control_string
      end
    end
  end
end
