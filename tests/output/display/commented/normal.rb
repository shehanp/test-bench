require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Commented" do
      context "Normal output level" do
        handle = TestBench::Output::Display.new

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.commented

        handle.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
