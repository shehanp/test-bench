require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Entered" do
      handle = TestBench::Output::Structure.new

      device = StringIO.new

      write = Controls::Output::Write.configure handle, device: device, indentation: 0

      event = Controls::Event.context_entered

      handle.(event)

      test "Prose is written" do
        assert device.string == "Some Context\n"
      end

      test "Indentation is increased" do
        assert write.indentation == 1
      end
    end
  end
end
