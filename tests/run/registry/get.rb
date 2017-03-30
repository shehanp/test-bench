require_relative '../../test_init'

context "Run" do
  context "Registry" do
    context "Get" do
      registry = TestBench::Run::Registry.new

      put_run = TestBench::Run.new

      receiver = Object.new

      registry.put put_run, receiver

      run = registry.get receiver

      test "Returns entry previously added to registry" do
        assert run.equal?(put_run)
      end
    end
  end
end
