require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Test Finished" do
      context "Verbose output level" do
        handle = TestBench::Output::Display.new
        handle.output_level = :verbose

        write = Controls::Output::Write.configure handle, indentation: 1

        event = Controls::Event.test_finished

        handle.(event)

        test "Indentation is decreased" do
          assert write.indentation == 0
        end
      end
    end
  end
end
