require_relative '../../../test_init'

context "Event" do
  context "Publish" do
    context "Registry" do
      context "Put" do
        registry = TestBench::Event::Publish::Registry.new

        receiver = Object.new

        publisher = TestBench::Event::Publish.new

        registry.put publisher, receiver

        test "Publisher is added to registry" do
          entry = registry.table[receiver.hash]

          assert entry.equal?(publisher)
        end
      end
    end
  end
end
