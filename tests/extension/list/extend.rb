require_relative '../../test_init'

context "Extension" do
  context "List" do
    context "Extend" do
      extension_1 = Controls::Extension.example
      extension_2 = Controls::Extension.example

      run = TestBench::Run.new

      list = TestBench::Extension::List.new extension_1, extension_2
      list.extend run

      test "Run is extended by each extension" do
        assert extension_1.extended?(run)
        assert extension_2.extended?(run)
      end
    end
  end
end
