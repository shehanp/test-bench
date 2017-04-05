require_relative '../test_init'

context "Extension" do
  run = TestBench::Run.new

  extension = Controls::Extension.example

  extension.(run)

  test "Each handler subscribes to run" do
    assert run.subscribed?(extension.handlers[0])
  end
end
