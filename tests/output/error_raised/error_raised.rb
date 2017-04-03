require_relative '../../test_init'

context "Output" do
  context "Error Raised" do
    error = TestBench::Output::BacktraceFilter::ExampleError.build

    event = TestBench::Run::Event::ErrorRaised.new error

    output = TestBench::Output.new

    output.output_device = output_device = StringIO.new

    output.handle event

    test "Error message and filtered backtrace is written" do
      control_string = TestBench::Output::BacktraceFilter::ExampleError.filtered

      assert output_device.string == control_string
    end
  end
end
