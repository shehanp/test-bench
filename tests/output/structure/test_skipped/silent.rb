require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Test Skipped" do
      context "Silent output level" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :silent

        device = StringIO.new

        Controls::Output::Write.configure structure, device: device

        event = Controls::Event.test_skipped

        structure.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
