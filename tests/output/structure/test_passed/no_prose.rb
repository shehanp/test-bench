require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Passed" do
      context "No Prose" do
        handle = TestBench::Output::Handlers::Structure.new

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
