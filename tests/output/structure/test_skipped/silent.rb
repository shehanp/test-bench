require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Test Skipped" do
      context "Silent output level" do
        handle = TestBench::Output::Structure.new
        handle.output_level = :silent

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.test_skipped

        handle.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
