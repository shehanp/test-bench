module TestBench
  module Structure
    def assert subject, assertions_module=nil, &action
      Assert.(
        TestBench::Assert,
        binding,
        subject,
        assertions_module,
        &action
      )
    end

    def refute subject, assertions_module=nil, &action
      Assert.(
        TestBench::Assert::Refute,
        binding,
        subject,
        assertions_module,
        &action
      )
    end
  end
end
