require_relative './examples_init'

context "Example" do
  context "Some Context" do
    10.times do |i|
      test "Passing test ##{i}" do
        assert true
      end
    end
  end
end

