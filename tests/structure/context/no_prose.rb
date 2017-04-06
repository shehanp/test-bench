require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "No prose" do
      structure = Controls::Structure.example

      structure.instance_exec do
        context
      end

      context "Entered event" do
        event = Controls::Event.context_entered prose: :none

        test "Prose is nil" do
          assert structure.published?(event)
        end
      end

      context "Exited event" do
        event = Controls::Event.context_exited prose: :none

        test "Prose is nil" do
          assert structure.published?(event)
        end
      end
    end
  end
end
