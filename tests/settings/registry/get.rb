require_relative '../../test_init'

context "Settings" do
  context "Registry" do
    context "Get" do
      registry = TestBench::Settings::Registry.new

      put_settings = TestBench::Settings.new

      receiver = Object.new

      registry.put put_settings, receiver

      settings = registry.get receiver

      test "Returns entry previously added to registry" do
        assert settings.equal?(put_settings)
      end
    end
  end
end
