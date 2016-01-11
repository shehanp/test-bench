require_relative '../init'

pattern = ENV['TEST_FILE_PATTERN'] || 'tests/**/*.rb'

test_files = Dir[pattern]
if test_files.empty?
  warn "No test files selected by pattern #{pattern.inspect}"
  exit 1
end

test_files.each_with_index do |test_file, cc|
  next if test_file == __FILE__

  print "Running test #{test_file.inspect}... "
  $stdout.flush

  child_process = fork do
    load test_file
  end

  _, status = Process.wait2 child_process

  if status.exitstatus.zero?
    puts 'OK'
  else
    puts 'FAIL'
    exit 1
  end
end
