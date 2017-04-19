require_relative '../../../test_init'

context "Event" do
  context "Publish" do
    context "Registry" do
      context "Get" do
        registry = TestBench::Event::Publish::Registry.new

        put_publisher = TestBench::Event::Publish.new

        receiver = Object.new

        registry.put put_publisher, receiver

        publisher = registry.get receiver

        test "Returns entry previously added to registry" do
          assert publisher.equal?(put_publisher)
        end
      end
    end
  end
end
