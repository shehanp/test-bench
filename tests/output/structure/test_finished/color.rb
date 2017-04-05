require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Finished" do
      context "Color" do
        handle = TestBench::Output::Handlers::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure(
          handle,
          device: device,
          color: true
        )

        event = Controls::Event.test_finished

        handle.(event)

        test "Prose is written in green" do
          control_string = TerminalColors::Apply.("Some test", fg: :green)

          assert device.string.chomp == control_string
        end
      end
    end
  end
end
