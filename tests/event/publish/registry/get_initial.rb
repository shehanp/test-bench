require_relative '../../../test_init'

context "Event" do
  context "Publish" do
    context "Registry" do
      context "Get Initial" do
        registry = TestBench::Event::Publish::Registry.new

        receiver = Object.new

        publisher = registry.get receiver

        test "Returns a publisher" do
          assert publisher.instance_of?(TestBench::Event::Publish)
        end

        test "Publisher is added to registry" do
          entry = registry.table[receiver.hash]

          assert entry.equal?(publisher)
        end
      end
    end
  end
end
