require_relative '../../test_init'

context "Output" do
  context "Error Raised" do
    context "Reverse Backtraces" do
      error = Controls::Error.example

      event = TestBench::Run::Event::ErrorRaised.new error

      output = TestBench::Output.new
      output.reverse_backtraces = true
      output.output_level = :verbose

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Backtrace is reversed" do
        control_string = Controls::Error::Backtrace::Text.reversed

        assert output_device.string == control_string
      end
    end
  end
end
