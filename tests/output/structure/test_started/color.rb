require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      context "Color" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :verbose

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device, color: true

        event = Controls::Event.test_started

        structure.(event)

        test "Prose is written in gray" do
          control_string = TerminalColors::Apply.("Some test", fg: :black, bold: true)

          assert device.string.chomp == control_string
        end
      end
    end
  end
end
