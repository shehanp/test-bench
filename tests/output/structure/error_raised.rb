require_relative '../../test_init'

context "Output" do
  context "Structure" do
    context "Error Raised" do
      handle = TestBench::Output::Handlers::Structure.new

      device = StringIO.new

      Controls::Output::Write.configure handle.display_error, device: device

      event = Controls::Event.error_raised

      handle.(event)

      test "Error is displayed" do
        assert device.string == Controls::Error::Backtrace::Text.filtered
      end
    end
  end
end
