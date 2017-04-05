require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Passed" do
      handle = TestBench::Output::Handlers::Structure.new

      device = StringIO.new

      Controls::Output::Write.configure handle, device: device

      event = Controls::Event.test_passed

      handle.(event)

      test "Prose is written" do
        assert device.string == "Some test\n"
      end
    end
  end
end
