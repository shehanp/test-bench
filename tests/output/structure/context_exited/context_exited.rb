require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Exited" do
      handle = TestBench::Output::Handlers::Structure.new

      write = Controls::Output::Write.configure handle, indentation: 1

      event = Controls::Event.context_exited
      handle.(event)

      test "Indentation is decreased" do
        assert write.indentation == 0
      end
    end
  end
end
