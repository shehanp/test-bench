require_relative '../../test_init'

context "Output" do
  context "Display" do
    context "Error Raised" do
      handle = TestBench::Output::Display.new

      device = StringIO.new

      Controls::Output::Write.configure handle.error, device: device

      event = Controls::Event.error_raised

      handle.(event)

      test "Error is displayed" do
        assert device.string == Controls::Error::Backtrace::Text.filtered
      end
    end
  end
end
