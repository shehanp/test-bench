require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Context Exited" do
      context "Silent output level" do
        handle = TestBench::Output::Display.new

        write = Controls::Output::Write.configure handle, indentation: 1, output_level: :silent

        event = Controls::Event.context_exited
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 1
        end
      end
    end
  end
end
