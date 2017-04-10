require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Test Finished" do
      context "No Prose" do
        handle = TestBench::Output::Display.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.test_finished prose: :none

        handle.(event)

        test "'Test' is used in place of prose" do
          assert device.string == "Test\n"
        end
      end
    end
  end
end
