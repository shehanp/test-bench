require_relative '../../test_init'

context "Output" do
  context "Write" do
    context "Dependency" do
      cls = Class.new do
        include TestBench::Output::Write::Dependency
      end

      text = 'Some text'

      write = cls.new.write
      write.(text)

      test "Text is written to string" do
        assert write.device.string == "#{text}\n"
      end
    end
  end
end
