require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "Entered" do
      structure = Controls::Structure.example

      structure.instance_exec do
        context "Some Context"
      end

      test "Event is published" do
        event = Controls::Event.context_entered

        assert structure.published?(event)
      end
    end
  end
end
