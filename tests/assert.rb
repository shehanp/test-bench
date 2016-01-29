require_relative './test_init'

context 'Assert' do
  context 'Implicit Assertion' do
    context 'Truthy' do
      test 'Without Message' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        assert 'truthy'

        assert log_output.string == %{Assertion passed (Target: "truthy")\n}
      end

      test 'With Message' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        assert 'truthy', 'some-message'

        assert log_output.string == %{Assertion passed (Message: "some-message", Target: "truthy")\n}
      end
    end

    context 'Falsey' do
      test 'Without Message' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        begin
          line = __LINE__; assert nil
        rescue TestBench::Assert::Failure => error
        end

        assert log_output.string == %{Assertion failed (Target: nil)\nAssertion failure (Line: #{line}, File: #{__FILE__.inspect})\n}
        assert error
      end

      test 'With Message' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        begin
          line = __LINE__; assert nil, 'some-message'
        rescue TestBench::Assert::Failure => error
        end

        assert log_output.string == %{Assertion failed (Message: "some-message", Target: nil)\nAssertion failure (Line: #{line}, File: #{__FILE__.inspect})\n}
        assert error
      end
    end
  end

  context 'Block Form Assertion' do
    context 'Object' do
      class ObjectWithAssertions
        module Assertions
          def fail?
            false
          end

          def pass?
            true
          end

          def inspect
            'object-with-assertions'
          end
        end
      end

      test 'Pass (0-Arity)' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        object = ObjectWithAssertions.new
        assert object do
          pass?
        end

        assert log_output.string == %{Assertion passed (Target: object-with-assertions)\n}
      end

      test 'Pass (1-Arity)' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        object = ObjectWithAssertions.new
        assert object do |o|
          o.pass?
        end

        assert log_output.string == %{Assertion passed (Target: object-with-assertions)\n}
      end

      test 'Fail (No Message)' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        object = ObjectWithAssertions.new
        begin
          line = __LINE__ ; assert object do fail? end
        rescue TestBench::Assert::Failure => error
        end

        assert log_output.string == %{Assertion failed (Target: object-with-assertions)\nAssertion failure (Line: #{line}, File: #{__FILE__.inspect})\n}
        assert error
      end

      test 'Fail (Message)' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        object = ObjectWithAssertions.new
        begin
          line = __LINE__ ; assert object, 'some-message' do fail? end
        rescue TestBench::Assert::Failure => error
        end

        assert log_output.string == %{Assertion failed (Message: "some-message", Target: object-with-assertions)\nAssertion failure (Line: #{line}, File: #{__FILE__.inspect})\n}
        assert error
      end

      context 'Explicit Assertions Module' do
        mod = Module.new do
          def pass?
            true
          end

          def inspect
            'object-with-other-assertions'
          end
        end

        log_output = StringIO.new
        TestBench::Logging.configure log_output

        object = ObjectWithAssertions.new
        assert object, mod do
          pass?
        end

        assert log_output.string == %{Assertion passed (Subject: object-with-other-assertions)\n}
      end
    end

    context 'Class' do
      class ClassWithAssertions
        class << self
          module Assertions
            def fail?
              true
            end

            def pass?
              true
            end

            def inspect
              'class-with-assertions'
            end
          end
        end
      end

      test 'Pass' do
        assert ClassWithAssertions do
          pass?
        end
      end
    end

    context 'Module' do
      module ModuleWithAssertions
        module Assertions
          def fail?
            true
          end

          def pass?
            true
          end

          def inspect
            'module-with-assertions'
          end
        end
      end

      test 'Pass' do
        log_output = StringIO.new
        TestBench::Logging.configure log_output

        object = ModuleWithAssertions
        assert object do
          pass?
        end

        assert log_output.string == %{Assertion passed (Target: module-with-assertions)\n}
      end
    end
  end
end
