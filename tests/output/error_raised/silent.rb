require_relative '../../test_init'

context "Output" do
  context "Error Raised" do
    context "Silent output level" do
      error = TestBench::Output::BacktraceFilter::ExampleError.build

      event = TestBench::Run::Event::ErrorRaised.new error

      output = TestBench::Output.new
      output.output_level = :silent

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Error message is written without remainder of backtrace" do
        control_string = TestBench::Output::BacktraceFilter::ExampleError.filtered.each_line.first

        assert output_device.string == control_string
      end
    end
  end
end
