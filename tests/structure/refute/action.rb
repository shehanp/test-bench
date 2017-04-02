require_relative '../../test_init'

context "Structure" do
  context "Refute" do
    context "Action" do
      subject = Object.new

      assertions_module = Module.new

      structure = TestBench::Structure::Example.build

      executed = false

      structure.instance_exec do
        refute nil do
          executed = true
          false
        end
      end

      test "Is executed" do
        assert executed
      end
    end
  end
end
