require_relative '../../test_init'

context "Output" do
  context "Error Raised" do
    context "Verbose output level" do
      error = TestBench::Output::BacktraceFilter::ExampleError.build

      event = TestBench::Run::Event::ErrorRaised.new error

      output = TestBench::Output.new
      output.output_level = :verbose

      output.output_device = output_device = StringIO.new

      output.handle event

      test "Error message is written with full backtrace" do
        control_string = TestBench::Output::BacktraceFilter::ExampleError.unfiltered

        assert output_device.string == control_string
      end
    end
  end
end
