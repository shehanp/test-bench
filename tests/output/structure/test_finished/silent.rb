require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Finished" do
      context "Silent output level" do
        structure = TestBench::Output::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device, output_level: :silent

        event = Controls::Event.test_finished

        structure.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
