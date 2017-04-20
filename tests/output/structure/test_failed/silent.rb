require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Failed" do
      context "Silent output level" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :silent

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device

        event = Controls::Event.test_failed

        structure.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
