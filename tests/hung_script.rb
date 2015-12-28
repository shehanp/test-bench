require_relative './test_init'

exit 0 unless ENV['TEST_HUNG_SCRIPT'] == 'on'

x = 0

loop do
  x += 1
  if x == 500000
    warn 'Hung process running'
    x = 0
  end
end
