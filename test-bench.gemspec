# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'test_bench'
  s.version = '0.5.0'

  s.authors = ['Nathan Ladd']
  s.homepage = 'https://github.com/ntl/test-bench'
  s.email = 'nathanladd+github@gmail.com'
  s.licenses = %w(MIT)
  s.summary = "Test framework designed for extreme simplicity"
  s.description = <<-INNER_TEXT
Test framework designed for extreme simplicity. In contrast to other popular test frameworks for ruby, test bench only has three methods: context, test, and assert.
  INNER_TEXT

  s.executables = ['tb']
  s.bindir      = 'bin'

  s.require_paths = %w(lib)
  s.files = Dir.glob 'lib/**/*'
  s.platform = Gem::Platform::RUBY

  s.add_runtime_dependency 'extended_logger'
end
