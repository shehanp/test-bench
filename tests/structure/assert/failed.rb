require_relative '../../test_init'

context "Structure" do
  context "Assert" do
    context "Failed" do
      structure = TestBench::Structure::Example.build

      context do
        begin
          structure.instance_exec do
            assert false
          end
        rescue TestBench::Assert::Failed
        end

        test "Asserted event is published" do
          assert structure.published?(TestBench::Run::Event::Assertion::Asserted)
        end

        test "Assertion passed event is not published" do
          refute structure.published?(TestBench::Run::Event::Assertion::Passed)
        end

        test "Assertion failed event is published" do
          assert structure.published?(TestBench::Run::Event::Assertion::Failed)
        end
      end

      context "Error" do
        begin
          structure.instance_exec do
            assert false
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
