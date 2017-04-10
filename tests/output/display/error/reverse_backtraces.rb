require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Error" do
      context "Reverse Backtraces" do
        error = Controls::Error.example

        device = StringIO.new

        display_error = TestBench::Output::Display::Error.new
        display_error.reverse_backtraces = true

        Controls::Output::Write.configure display_error, device: device

        display_error.(error)

        test "Backtrace is reversed" do
          control_string = Controls::Error::Backtrace::Text.reversed

          assert device.string == control_string
        end
      end
    end
  end
end
