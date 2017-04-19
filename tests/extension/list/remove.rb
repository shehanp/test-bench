require_relative '../../test_init'

context "Extension" do
  context "List" do
    context "Remove" do
      extension = Controls::Extension.example

      context "By Instance" do
        list = TestBench::Extension::List.new extension

        assert list.extensions == [extension]

        list.remove extension

        test "Extension is removed" do
          assert list.extensions == []
        end
      end

      context "By Class" do
        list = TestBench::Extension::List.new extension

        assert list.extensions == [extension]

        list.remove Controls::Extension::Example

        test "Extension is removed" do
          assert list.extensions == []
        end
      end
    end
  end
end
