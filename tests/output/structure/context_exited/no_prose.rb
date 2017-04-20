require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Exited" do
      context "No prose" do
        structure = TestBench::Output::Structure.new

        write = Controls::Output::Write.configure structure, indentation: 1

        event = Controls::Event.context_exited prose: :none
        structure.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 1
        end
      end
    end
  end
end
