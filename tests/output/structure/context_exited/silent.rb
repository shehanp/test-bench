require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Exited" do
      context "Silent output level" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :silent

        write = Controls::Output::Write.configure structure, indentation: 1

        event = Controls::Event.context_exited
        structure.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 1
        end
      end
    end
  end
end
