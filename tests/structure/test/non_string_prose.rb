require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Non-String Prose" do
      structure = Controls::Structure.example

      begin
        structure.instance_exec do
          test Object.new
        end
      rescue TypeError => type_error
      end

      test "Raises type error" do
        refute type_error.nil?
      end
    end
  end
end
