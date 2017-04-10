require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      context "No Prose" do
        handle = TestBench::Output::Structure.new
        handle.output_level = :verbose

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.test_started prose: :none

        handle.(event)

        test "'Test' is used in place of prose" do
          assert device.string == "Test\n"
        end
      end
    end
  end
end
