require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Entered" do
      context "No Prose" do
        handle = TestBench::Output::Handlers::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure(
          handle,
          device: device
        )

        event = Controls::Event.context_entered prose: :none

        handle.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
