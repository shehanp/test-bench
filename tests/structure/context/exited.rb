require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "Exited" do
      structure = Controls::Structure.example

      structure.instance_exec do
        context "Some context"
      end

      test "Event is published" do
        event = TestBench::Run::Event::ContextExited.new 'Some context'

        assert structure.published?(event)
      end
    end
  end
end
