require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Failed" do
      context "No Prose" do
        structure = TestBench::Output::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device

        event = Controls::Event.test_failed prose: :none

        structure.(event)

        test "'Test' is written" do
          assert device.string == "Test\n"
        end
      end
    end
  end
end
