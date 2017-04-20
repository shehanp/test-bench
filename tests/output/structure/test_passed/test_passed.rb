require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Passed" do
      structure = TestBench::Output::Structure.new

      device = StringIO.new

      Controls::Output::Write.configure structure, device: device

      event = Controls::Event.test_passed

      structure.(event)

      test "Prose is written" do
        assert device.string == "Some test\n"
      end
    end
  end
end
