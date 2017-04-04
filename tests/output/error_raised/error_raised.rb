require_relative '../../test_init'

context "Output" do
  context "Error Raised" do
    error = Controls::Error.example

    event = TestBench::Run::Event::ErrorRaised.new error

    output = TestBench::Output.new

    output.output_device = output_device = StringIO.new

    output.handle event

    test "Error message and filtered backtrace is written" do
      control_string = Controls::Error::Backtrace::Text.filtered

      assert output_device.string == control_string
    end
  end
end
