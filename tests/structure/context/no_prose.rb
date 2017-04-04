require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "No prose" do
      structure = Controls::Structure.example

      structure.instance_exec do
        context
      end

      context "Entered event" do
        event = TestBench::Run::Event::ContextEntered.new nil

        test "Prose is nil" do
          assert structure.published?(event)
        end
      end

      context "Exited event" do
        event = TestBench::Run::Event::ContextExited.new nil

        test "Prose is nil" do
          assert structure.published?(event)
        end
      end
    end
  end
end
