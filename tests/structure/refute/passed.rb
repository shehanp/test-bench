require_relative '../../test_init'

context "Structure" do
  context "Refute" do
    context "Passed" do
      structure = TestBench::Structure::Example.new

      subscriber = structure.get_subscriber

      structure.instance_exec do
        refute false
      end

      test "Asserted event is published" do
        assert subscriber.received?(TestBench::Run::Event::Assertion::Asserted)
      end

      test "Assertion passed event is published" do
        assert subscriber.received?(TestBench::Run::Event::Assertion::Passed)
      end

      test "Assertion failed event is not published" do
        refute subscriber.received?(TestBench::Run::Event::Assertion::Failed)
      end
    end
  end
end
