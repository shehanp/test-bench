require_relative '../../test_init'

context "Structure" do
  context "Assert" do
    context "Action" do
      subject = Object.new

      assertions_module = Module.new

      structure = TestBench::Structure::Example.new

      subscriber = structure.get_subscriber

      executed = false

      structure.instance_exec do
        assert nil do
          executed = true
          true
        end
      end

      test "Is executed" do
        assert executed
      end
    end
  end
end
