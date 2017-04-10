require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Skipped" do
      context "No Prose" do
        handle = TestBench::Output::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.test_skipped prose: :none

        handle.(event)

        test "'Test' is written" do
          assert device.string == "Test\n"
        end
      end
    end
  end
end
