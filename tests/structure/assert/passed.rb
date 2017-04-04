require_relative '../../test_init'

context "Structure" do
  context "Assert" do
    context "Passed" do
      structure = Controls::Structure.example

      structure.instance_exec do
        assert true
      end

      test "Asserted event is published" do
        assert structure.published?(TestBench::Run::Event::Asserted)
      end

      test "Assertion passed event is published" do
        assert structure.published?(TestBench::Run::Event::AssertionPassed)
      end

      test "Assertion failed event is not published" do
        refute structure.published?(TestBench::Run::Event::AssertionFailed)
      end
    end
  end
end
