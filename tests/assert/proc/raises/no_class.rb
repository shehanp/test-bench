require_relative '../../../test_init'

context "Assert" do
  context "Proc" do
    context "Raises Error" do
      context "Error Class Not Specified" do
        context "Error raised" do
          result = TestBench::Assert.(->{ fail }, TestBench::Assert::AssertionsModule::Proc) do
            raises?
          end

          test "Returns true" do
            assert result == true
          end
        end

        context "Error not raised" do
          result = TestBench::Assert.(->{ }, TestBench::Assert::AssertionsModule::Proc) do
            raises?
          end

          test "Returns false" do
            assert result == false
          end
        end
      end
    end
  end
end
