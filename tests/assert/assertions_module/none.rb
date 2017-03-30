require_relative '../../test_init'

context "Assert" do
  context "Assertions Module" do
    context "None" do
      subject = Object.new

      included_modules = subject.singleton_class.included_modules

      subject = TestBench::Assert::AssertionsModule.(subject)

      test "Does not extend anything" do
        extended_modules = subject.singleton_class.included_modules - included_modules

        assert extended_modules.empty?
      end
    end
  end
end
