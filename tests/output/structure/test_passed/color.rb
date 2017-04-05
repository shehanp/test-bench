require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Passed" do
      context "Color" do
        handle = TestBench::Output::Handlers::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device, color: true

        event = Controls::Event.test_passed

        handle.(event)

        test "Prose is written in green" do
          control_string = "#{TerminalColors::Apply.('Some test', fg: :green)}\n"

          assert device.string == control_string
        end
      end
    end
  end
end
