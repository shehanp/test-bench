require_relative '../../test_init'

context "Output" do
  context "Display Error" do
    context "Verbose output level" do
      error = Controls::Error.example

      device = StringIO.new

      display_error = TestBench::Output::DisplayError.new
      display_error.output_level = :verbose

      Controls::Output::Write.configure display_error, device: device

      display_error.(error)

      test "Error message is written with full backtrace" do
        control_string = Controls::Error::Backtrace::Text.unfiltered

        assert device.string == control_string
      end
    end
  end
end
