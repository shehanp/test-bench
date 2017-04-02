require_relative '../../test_init'

context "Structure" do
  context "Assert" do
    context "Assertions module" do
      subject = Object.new

      assertions_module = Module.new

      structure = TestBench::Structure::Example.build

      structure.instance_exec do
        assert subject, assertions_module
      end

      test "Extends module onto subject" do
        assert subject.singleton_class.included_modules.include?(assertions_module)
      end
    end
  end
end
