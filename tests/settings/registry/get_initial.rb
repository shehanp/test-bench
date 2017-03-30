require_relative '../../test_init'

context "Settings" do
  context "Registry" do
    context "Get Initial" do
      registry = TestBench::Settings::Registry.new

      receiver = Object.new

      settings = registry.get receiver

      test "Returns a settings instance" do
        assert settings.instance_of?(TestBench::Settings)
      end

      test "Settings instance is added to registry" do
        entry = registry.table[receiver.hash]

        assert entry.equal?(settings)
      end
    end
  end
end
