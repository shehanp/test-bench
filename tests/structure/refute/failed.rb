require_relative '../../test_init'

context "Structure" do
  context "Refute" do
    context "Failed" do
      structure = Controls::Structure.example

      context do
        begin
          structure.instance_exec do
            refute true
          end
        rescue TestBench::Assert::Failed
        end

        test "Asserted event is published" do
          assert structure.published?(TestBench::Run::Event::Asserted)
        end

        test "Assertion passed event is not published" do
          refute structure.published?(TestBench::Run::Event::AssertionPassed)
        end

        test "Assertion failed event is published" do
          assert structure.published?(TestBench::Run::Event::AssertionFailed)
        end
      end

      context "Error" do
        begin
          structure.instance_exec do
            refute true
          end
        rescue TestBench::Assert::Failed => error
        end

        test "Is raised" do
          refute error.nil?
        end
      end
    end
  end
end
