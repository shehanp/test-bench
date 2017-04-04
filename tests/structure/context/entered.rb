require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "Entered" do
      structure = Controls::Structure.example

      structure.instance_exec do
        context "Some context"
      end

      test "Event is published" do
        event = TestBench::Run::Event::ContextEntered.new 'Some context'

        assert structure.published?(event)
      end
    end
  end
end
