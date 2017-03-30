require_relative '../test_init'

context "Assert" do
  context "Refute" do
    context do
      subject = Object.new

      result = TestBench::Assert::Refute.(subject)

      test "Returns false" do
        assert result == false
      end
    end

    context "Subject is nil" do
      subject = nil

      result = TestBench::Assert::Refute.(subject)

      test "Returns true" do
        assert result == true
      end
    end

    context "Subject is false" do
      subject = false

      result = TestBench::Assert::Refute.(subject)

      test "Returns true" do
        assert result == true
      end
    end
  end
end
