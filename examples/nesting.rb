require_relative './examples_init'

context "Example" do
  context "Outer Context" do
    context "Inner Context" do
      context "Deep Inner Context" do
        comment "Some comment"

        context do
          test "Some test" do
            assert true
            assert true

            comment "Some comment"
          end

          test "Failing test" do
            refute true
          end

          test "Skipped test"
        end
      end
    end

    context "Other Inner Context" do
      test "Other test" do
        assert true
      end
    end
  end

  context "Other Outer Context"
  context "Other Other Context"
end
