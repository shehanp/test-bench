require_relative '../../test_init'

context "Settings" do
  context "Registry" do
    context "Put" do
      registry = TestBench::Settings::Registry.new

      receiver = Object.new

      settings = TestBench::Settings.new

      registry.put settings, receiver

      test "Settings instance is added to registry" do
        entry = registry.table[receiver.hash]

        assert entry.equal?(settings)
      end
    end
  end
end
