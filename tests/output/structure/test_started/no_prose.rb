require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      context "No Prose" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :verbose

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device

        event = Controls::Event.test_started prose: :none

        structure.(event)

        test "'Test' is used in place of prose" do
          assert device.string == "Test\n"
        end
      end
    end
  end
end
