require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "Exited" do
      structure = Controls::Structure.example

      structure.instance_exec do
        context "Some Context"
      end

      test "Event is published" do
        event = Controls::Event.context_exited

        assert structure.published?(event)
      end
    end
  end
end
