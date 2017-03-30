require_relative '../../test_init'

context "Run" do
  context "Registry" do
    context "Get Initial" do
      registry = TestBench::Run::Registry.new

      receiver = Object.new

      run = registry.get receiver

      test "Returns a run instance" do
        assert run.instance_of?(TestBench::Run)
      end

      test "Run instance is added to registry" do
        entry = registry.table[receiver.hash]

        assert entry.equal?(run)
      end
    end
  end
end
