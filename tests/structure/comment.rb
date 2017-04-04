require_relative '../test_init'

context "Structure" do
  context "Comment" do
    structure = Controls::Structure.example

    structure.instance_exec do
      comment "Some comment"
    end

    test "Commented event is published" do
      event = TestBench::Run::Event::Commented.new 'Some comment'

      assert structure.published?(event)
    end
  end
end
