require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Failed" do
      handle = TestBench::Output::Handlers::Structure.new

      device = StringIO.new

      Controls::Output::Write.configure handle, device: device

      event = Controls::Event.test_failed

      handle.(event)

      test "Prose is written" do
        assert device.string == "Some test\n"
      end
    end
  end
end
