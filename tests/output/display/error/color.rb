require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Error" do
      context "Color" do
        error = Controls::Error.example

        device = StringIO.new

        display_error = TestBench::Output::Display::Error.new

        Controls::Output::Write.configure display_error, device: device, color: true

        display_error.(error)

        test "Error message is written in red" do
          control_string = Controls::Error::Backtrace::Text.filtered

          control_string = control_string.each_line.map do |line|
            TerminalColors::Apply.(line.chomp, fg: :red)
          end.join "\n"

          assert device.string.chomp == control_string
        end
      end
    end
  end
end
