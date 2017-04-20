require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Commented" do
      context "Normal output level" do
        structure = TestBench::Output::Structure.new

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device

        event = Controls::Event.commented

        structure.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
