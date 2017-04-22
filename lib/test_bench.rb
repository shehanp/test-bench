require 'logger'
require 'observer'
require 'set'

require 'terminal_colors'

# Core implementation
require 'test_bench/logger'
require 'test_bench/string_casing/camel'
require 'test_bench/string_casing/capitalize'
require 'test_bench/string_casing/pascal'
require 'test_bench/string_casing/underscore'

require 'test_bench/settings'
require 'test_bench/settings/defaults'
require 'test_bench/settings/environment/set'
require 'test_bench/settings/macro'
require 'test_bench/settings/output_level'

require 'test_bench/assert'
require 'test_bench/assert/assertions_module'
require 'test_bench/assert/assertions_module/proc'
require 'test_bench/assert/failed'
require 'test_bench/assert/refute'

require 'test_bench/event/module'
require 'test_bench/event/publish'
require 'test_bench/event/publish/registry'
require 'test_bench/event/publish/registry/global'
require 'test_bench/event/publish/registry/key'
require 'test_bench/event/subscriber'

require 'test_bench/event/define'
require 'test_bench/event'

require 'test_bench/extension'
require 'test_bench/extension/list'
require 'test_bench/extension/list/global'
require 'test_bench/extension/handle'
require 'test_bench/extension/handle/macro'
require 'test_bench/extension/handle/method_name'

require 'test_bench/structure'
require 'test_bench/structure/assert'

require 'test_bench/test_bench'

# Output & bundled extensions
require 'test_bench/output/clock'
require 'test_bench/output/clock/dependency'

require 'test_bench/output/write'
require 'test_bench/output/write/dependency'

require 'test_bench/output/display_error'
require 'test_bench/output/display_error/dependency'
require 'test_bench/output/display_error/filter_backtrace'

require 'test_bench/output/defaults'
require 'test_bench/output/exit_status'
require 'test_bench/output/structure'
require 'test_bench/output/summary'

require 'test_bench/output'
