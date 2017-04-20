require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Entered" do
      context "No Prose" do
        structure = TestBench::Output::Structure.new

        device = StringIO.new

        write = Controls::Output::Write.configure structure, device: device, indentation: 0

        event = Controls::Event.context_entered prose: :none

        structure.(event)

        test "Nothing is written" do
          assert device.string == ''
        end

        test "Indentation is unchanged" do
          assert write.indentation == 0
        end
      end
    end
  end
end
