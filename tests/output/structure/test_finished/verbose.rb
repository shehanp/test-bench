require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Finished" do
      context "Verbose output level" do
        handle = TestBench::Output::Handlers::Structure.new

        write = Controls::Output::Write.configure handle, indentation: 1, output_level: :verbose

        event = Controls::Event.test_finished

        handle.(event)

        test "Indentation is decreased" do
          assert write.indentation == 0
        end
      end
    end
  end
end
