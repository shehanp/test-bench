require_relative '../../test_init'

context "Run" do
  context "Script" do
    context "System Exit is raised" do
      context = Object.new

      context "Exit status is zero" do
        ruby_source = 'exit(0); nil'

        script = TestBench::Run::Script.new ruby_source, context

        begin
          return_value = script.()
        rescue SystemExit
        end

        test "True is returned" do
          assert return_value == true
        end
      end

      context "Exit status is not zero" do
        ruby_source = 'exit(1); nil'

        script = TestBench::Run::Script.new ruby_source, context

        begin
          return_value = script.()
        rescue SystemExit
        end

        test "False is returned" do
          assert return_value == false
        end
      end
    end
  end
end
