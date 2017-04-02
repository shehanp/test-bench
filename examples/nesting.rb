require_relative './examples_init'

context "Example" do
  context "Outer Context" do
    context "Inner Context" do
      context "Deep Inner Context" do
        comment "Some comment"

        context do
          test "Some test" do
            comment "Some comment"
          end
        end
      end
    end

    context "Other Inner Context" do
      test "Other test"
    end
  end
end
