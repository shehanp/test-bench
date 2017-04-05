require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      context "Color" do
        handle = TestBench::Output::Handlers::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device, color: true, output_level: :verbose

        event = Controls::Event.test_started

        handle.(event)

        test "Prose is written in gray" do
          control_string = TerminalColors::Apply.("Some test", fg: :black, bold: true)

          assert device.string.chomp == control_string
        end
      end
    end
  end
end
