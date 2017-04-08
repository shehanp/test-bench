require_relative '../../test_init'

context "Structure" do
  context "Assert" do
    context "Asserted" do
      structure = Controls::Structure.example

      context do
        structure.instance_exec do
          assert true
        end

        test "Asserted event is published" do
          event = Controls::Event.asserted

          assert structure.published?(event)
        end
      end
    end
  end
end
