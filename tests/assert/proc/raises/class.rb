require_relative '../../../test_init'

context "Assert" do
  context "Proc" do
    context "Raises Error" do
      context "Error Class Is Specified" do
        error_class = Class.new StandardError

        context "Instance is raised" do
          result = TestBench::Assert.(->{ raise error_class }, TestBench::Assert::AssertionsModule::Proc) do
            raises? error_class
          end

          test "Returns true" do
            assert result == true
          end
        end

        context "Instance of subclass is raised" do
          subclass = Class.new error_class

          result = TestBench::Assert.(->{ raise subclass }, TestBench::Assert::AssertionsModule::Proc) do
            raises? error_class
          end

          test "Returns false" do
            assert result == false
          end
        end

        context "Error not raised" do
          result = TestBench::Assert.(->{ }, TestBench::Assert::AssertionsModule::Proc) do
            raises? error_class
          end

          test "Returns false" do
            assert result == false
          end
        end
      end
    end
  end
end
