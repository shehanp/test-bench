require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Exited" do
      context "No prose" do
        handle = TestBench::Output::Handlers::Structure.new

        write = Controls::Output::Write.configure handle, indentation: 1

        event = Controls::Event.context_exited prose: :none
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 1
        end
      end
    end
  end
end
