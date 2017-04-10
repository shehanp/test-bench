require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Test Passed" do
      context "No Prose" do
        handle = TestBench::Output::Display.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.test_passed prose: :none

        handle.(event)

        test "'Test' is written" do
          assert device.string == "Test\n"
        end
      end
    end
  end
end
