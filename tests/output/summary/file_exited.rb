require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "File Exited" do
      file_exited = Controls::Event.file_exited

      summary = TestBench::Output::Summary.new
      summary.(file_exited)

      test "Number of files is increased" do
        assert summary.files == 1
      end
    end
  end
end
