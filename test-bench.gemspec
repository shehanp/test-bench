# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'test_bench'
  s.version = '0.2.0'

  s.authors = ['Nathan Ladd']
  s.homepage = 'https://github.com/ntl/test-bench'
  s.email = 'nathanladd+github@gmail.com'
  s.licenses = %w(MIT)
  s.summary = 'Simple test framework based around running scripts'
  s.description = <<-INNER_TEXT
Unlike popular testing frameworks centered around x-unit or BDD principles,
test_bench aims to be a simple alternative. Test files are executed by the
library in complete isolation from one another by using fork(). In this way,
test runs can be executed in parallel. Assertions are simple pass/fail checks.
There is a minimal (and optional) DSL for structuring tests using familiar spec
methods like describe/context/specify/it.
  INNER_TEXT

  s.executables = ['tb']
  s.bindir      = 'bin'

  s.require_paths = %w(lib)
  s.files = Dir.glob 'lib/**/*'
  s.platform = Gem::Platform::RUBY

  s.add_runtime_dependency 'extended_logger', '~> 0'
end
