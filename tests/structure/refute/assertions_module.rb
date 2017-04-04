require_relative '../../test_init'

context "Structure" do
  context "Refute" do
    context "Assertions module" do
      subject = false

      assertions_module = Module.new

      structure = Controls::Structure.example

      structure.instance_exec do
        refute subject, assertions_module
      end

      test "Extends module onto subject" do
        assert subject.singleton_class.included_modules.include?(assertions_module)
      end
    end
  end
end
