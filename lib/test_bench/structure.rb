module TestBench
  module Structure
    def assert subject, assertions_module=nil, &action
      run = Run::Registry.get binding

      Assert.(TestBench::Assert, run, subject, assertions_module, &action)
    end

    def comment prose
      run = Run::Registry.get binding

      run.commented prose
    end

    def context prose=nil, &block
      run = Run::Registry.get binding

      run.context_entered prose

      unless block.nil?
        begin
          block.()
        rescue => error
          run.error_raised error
        end
      end

    ensure
      run.context_exited prose
    end

    def refute subject, assertions_module=nil, &action
      run = Run::Registry.get binding

      Assert.(TestBench::Assert::Refute, run, subject, assertions_module, &action)
    end

    def test prose=nil, &block
      run = Run::Registry.get binding

      run.test_started prose

      if block.nil?
        run.test_skipped prose
        return
      end

      begin
        block.()
        run.test_passed prose

      rescue => error
        run.error_raised error
        run.test_failed error, prose

      ensure
        run.test_finished prose
      end
    end
  end
end
