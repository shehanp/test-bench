require_relative '../../test_init'

context "Assert" do
  context "Assertions Module" do
    context "BasicObject" do
      assertions_module = Module.new

      subject = Object.new.tap &:freeze

      test "Raises an error" do
        begin
          TestBench::Assert::AssertionsModule.(subject, assertions_module)
        rescue TestBench::Assert::AssertionsModule::FrozenSubjectError => error
        end

        refute error.nil?
      end
    end
  end
end
