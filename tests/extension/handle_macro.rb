require_relative '../test_init'

context "Extension" do
  context "Handle Macro" do
    cls = Class.new do
      include TestBench::Extension

      handle Controls::Extension::Handler::Example
    end

    extension = cls.build

    test "Handler is instantiated" do
      assert extension.handlers.count == 1
      assert extension.handlers[0].instance_of?(Controls::Extension::Handler::Example)
    end
  end
end
