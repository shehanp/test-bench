require_relative './examples_init'

context "Example" do
  context "Some Context" do
    comment "Some comment"

    test "Passing" do
      assert true
    end

    test "Failing" do
      refute true
    end
  end
end
