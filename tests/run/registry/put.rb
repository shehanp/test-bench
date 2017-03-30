require_relative '../../test_init'

context "Run" do
  context "Registry" do
    context "Put" do
      registry = TestBench::Run::Registry.new

      receiver = Object.new

      run = TestBench::Run.new

      registry.put run, receiver

      test "Run instance is added to registry" do
        entry = registry.table[receiver.hash]

        assert entry.equal?(run)
      end
    end
  end
end
