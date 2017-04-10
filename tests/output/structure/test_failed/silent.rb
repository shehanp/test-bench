require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Failed" do
      context "Silent output level" do
        handle = TestBench::Output::Structure.new
        handle.output_level = :silent

        device = StringIO.new

        Controls::Output::Write.configure handle, device: device

        event = Controls::Event.test_failed

        handle.(event)

        test "Nothing is written" do
          assert device.string == ''
        end
      end
    end
  end
end
