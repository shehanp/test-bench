require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Entered" do
      handle = TestBench::Output::Handlers::Structure.new

      device = StringIO.new

      Controls::Output::Write.configure(
        handle,
        device: device
      )

      event = Controls::Event.context_entered

      handle.(event)

      test "Prose is written" do
        assert device.string == "Some Context\n"
      end
    end
  end
end
