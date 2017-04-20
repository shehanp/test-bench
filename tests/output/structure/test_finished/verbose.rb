require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Finished" do
      context "Verbose output level" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :verbose

        write = Controls::Output::Write.configure structure, indentation: 1

        event = Controls::Event.test_finished

        structure.(event)

        test "Indentation is decreased" do
          assert write.indentation == 0
        end
      end
    end
  end
end
