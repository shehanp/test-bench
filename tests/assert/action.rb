require_relative '../test_init'

context "Assert" do
  context "Action" do
    subject = Object.new

    context do
      result = TestBench::Assert.(subject) { Object.new }

      test "Returns true" do
        assert result == true
      end
    end

    context "Result is nil" do
      result = TestBench::Assert.(subject) { nil }

      test "Returns false" do
        assert result == false
      end
    end

    context "Result is false" do
      result = TestBench::Assert.(subject) { false }

      test "Returns false" do
        assert result == false
      end
    end

    context "Block argument" do
      block_argument = nil

      TestBench::Assert.(subject) { |arg| block_argument = arg }

      test "Is subject" do
        assert block_argument == subject
      end
    end

    context "Block execution context" do
      execution_context = nil

      TestBench::Assert.(subject) { execution_context = self }

      test "Is subject" do
        assert execution_context == subject
      end
    end
  end
end
