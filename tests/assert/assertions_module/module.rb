require_relative '../../test_init'

context "Assert" do
  context "Assertions Module" do
    context "Module" do
      assertions_module = Module.new

      subject = Module.new do
        const_set :Assertions, assertions_module
      end

      subject = TestBench::Assert::AssertionsModule.(subject)

      test "Extends subject" do
        assert subject.is_a?(assertions_module)
      end
    end
  end
end
