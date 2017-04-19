require_relative '../../test_init'

context "Extension" do
  context "List" do
    context "Extend" do
      extension_1 = Controls::Extension.example
      extension_2 = Controls::Extension.example

      publisher = TestBench::Event::Publish.new

      list = TestBench::Extension::List.new extension_1, extension_2
      list.extend publisher

      test "Publisher is extended by each extension" do
        assert extension_1.extended?(publisher)
        assert extension_2.extended?(publisher)
      end
    end
  end
end
