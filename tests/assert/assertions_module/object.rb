require_relative '../../test_init'

context "Assert" do
  context "Assertions Module" do
    context "Object" do
      assertions_module = Module.new

      cls = Class.new do
        const_set :Assertions, assertions_module
      end

      subject = cls.new

      subject = TestBench::Assert::AssertionsModule.(subject)

      test "Extends assertions module contained within class namespace" do
        assert subject.is_a?(assertions_module)
      end
    end
  end
end
