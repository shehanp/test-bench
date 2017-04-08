require_relative '../test_init'

context "Event" do
  context "Attribute" do
    cls = TestBench::Event.define :attr1, :attr2

    event = cls.new :val1, :val2

    test "First attribute" do
      assert event.attr1 == :val1
    end

    test "Second attribute" do
      assert event.attr2 == :val2
    end
  end
end
