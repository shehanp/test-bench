require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "Non-String Prose" do
      structure = TestBench::Structure::Example.build

      begin
        structure.instance_exec do
          context Object.new
        end
      rescue TypeError => type_error
      end

      test "Raises type error" do
        refute type_error.nil?
      end
    end
  end
end
