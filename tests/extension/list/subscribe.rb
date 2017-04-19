require_relative '../../test_init'

context "Extension" do
  context "List" do
    context "Subscribe" do
      extension_1 = Controls::Extension.example
      extension_2 = Controls::Extension.example

      publisher = TestBench::Event::Publish.new

      list = TestBench::Extension::List.new extension_1, extension_2
      list.subscribe publisher

      test "Each extension is subscribed to publisher" do
        assert extension_1.subscribed?(publisher)
        assert extension_2.subscribed?(publisher)
      end
    end
  end
end
