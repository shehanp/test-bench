require_relative '../test_init'

context "Extension" do
  publisher = TestBench::Event::Publish.new

  extension = Controls::Extension.example

  extension.(publisher)

  test "Each handler subscribes to publisher" do
    assert publisher.subscribed?(extension.handlers[0])
  end
end
