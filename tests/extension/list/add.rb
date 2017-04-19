require_relative '../../test_init'

context "Extension" do
  context "List" do
    context "Add" do
      list = TestBench::Extension::List.new

      extension_cls = Controls::Extension::Example

      extension = list.add extension_cls

      test "Extension is added" do
        assert list.extensions == [extension]
      end

      test "Extension is instantiated" do
        assert extension.instance_of?(extension_cls)
      end

      test "Handlers are configured" do
        refute extension.handlers.empty?
      end
    end
  end
end
