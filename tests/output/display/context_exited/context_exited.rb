require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Context Exited" do
      handle = TestBench::Output::Display.new

      device = StringIO.new

      write = Controls::Output::Write.configure handle, device: device, indentation: 2

      event = Controls::Event.context_exited
      handle.(event)

      test "Indentation is decreased" do
        assert write.indentation == 1
      end

      test "Nothing is written"do
        assert device.string == ''
      end
    end
  end
end
