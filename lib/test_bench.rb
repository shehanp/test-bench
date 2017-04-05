require 'logger'
require 'observer'
require 'set'

require 'terminal_colors'

# Core implementation
require 'test_bench/assert'
require 'test_bench/assert/assertions_module'
require 'test_bench/assert/assertions_module/proc'
require 'test_bench/assert/failed'
require 'test_bench/assert/refute'

require 'test_bench/extension'
require 'test_bench/extension/handle'
require 'test_bench/extension/handle/macro'
require 'test_bench/extension/handle/method_name'

require 'test_bench/logger'

require 'test_bench/run'
require 'test_bench/run/event'
require 'test_bench/run/registry'
require 'test_bench/run/registry/key'
require 'test_bench/run/subscriber'

require 'test_bench/settings'
require 'test_bench/settings/defaults'
require 'test_bench/settings/environment/set'
require 'test_bench/settings/macro'
require 'test_bench/settings/output_level'

require 'test_bench/structure'
require 'test_bench/structure/assert'

require 'test_bench/test_bench'

# Output & bundled extensions
require 'test_bench/output'
require 'test_bench/output/defaults'
require 'test_bench/output/filter_backtrace'

require 'test_bench/output/write'
require 'test_bench/output/write/dependency'

require 'test_bench/output/handle'

require 'test_bench/output/handlers/commented'
require 'test_bench/output/handlers/structure'
