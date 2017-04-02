require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "Entered" do
      structure = TestBench::Structure::Example.build

      structure.instance_exec do
        context "Some context"
      end

      test "Event is published" do
        event = TestBench::Run::Event::Context::Entered.new 'Some context'

        assert structure.published?(event)
      end
    end
  end
end
