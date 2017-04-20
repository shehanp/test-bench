require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Exited" do
      structure = TestBench::Output::Structure.new

      device = StringIO.new

      write = Controls::Output::Write.configure structure, device: device, indentation: 2

      event = Controls::Event.context_exited
      structure.(event)

      test "Indentation is decreased" do
        assert write.indentation == 1
      end

      test "Nothing is written"do
        assert device.string == ''
      end
    end
  end
end
