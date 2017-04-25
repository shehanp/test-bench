require_relative '../../test_init'

context "Run" do
  context "Script" do
    context = OpenStruct.new
    ruby_source = 'self.executed = true; nil'

    script = TestBench::Run::Script.new ruby_source, context

    return_value = script.()

    test "Ruby source is executed" do
      assert context.executed == true
    end

    test "True is returned" do
      assert return_value == true
    end
  end
end
