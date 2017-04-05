require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      handle = TestBench::Output::Handlers::Structure.new

      device = StringIO.new

      Controls::Output::Write.configure(
        handle,
        device: device
      )

      event = Controls::Event.test_started

      handle.(event)

      test "Nothing is written" do
        assert device.string == ''
      end
    end
  end
end
