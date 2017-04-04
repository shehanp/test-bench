require_relative '../../test_init'

context "Output" do
  context "Error Raised" do
    context "Color" do
      error = Controls::Error.example

      event = TestBench::Run::Event::ErrorRaised.new error

      output = TestBench::Output.new
      output.color = true

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Error message is written in red" do
        control_string = Controls::Error::Backtrace::Text.filtered

        control_string = control_string.each_line.map do |line|
          TerminalColors::Apply.(line.chomp, fg: :red)
        end.join "\n"

        assert output_device.string.chomp == control_string
      end
    end
  end
end
