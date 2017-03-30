module TestBench
  def self.activate
    ::Proc.class_exec do
      const_set :Assertions, Assert::AssertionsModule::Proc
    end
  end
end
