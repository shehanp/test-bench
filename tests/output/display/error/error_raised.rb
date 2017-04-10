require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Error" do
      error = Controls::Error.example

      device = StringIO.new

      display_error = TestBench::Output::Display::Error.new

      Controls::Output::Write.configure display_error, device: device

      display_error.(error)

      test "Error message and filtered backtrace is written" do
        control_string = Controls::Error::Backtrace::Text.filtered

        assert device.string == control_string
      end
    end
  end
end
