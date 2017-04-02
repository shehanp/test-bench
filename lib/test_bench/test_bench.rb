module TestBench
  def self.activate
    ::Proc.class_exec do
      const_set :Assertions, Assert::AssertionsModule::Proc
    end

    settings = TestBench::Settings.new
    TestBench::Settings::Environment::Set.(settings)

    run = TestBench::Run.new
    run.settings = settings

    main_object = TOPLEVEL_BINDING.receiver
    main_object.extend TestBench::Structure

    TestBench::Run::Registry.put run, main_object
  end
end
