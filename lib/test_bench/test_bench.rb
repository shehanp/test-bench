module TestBench
  def self.activate
    ::Proc.class_exec do
      const_set :Assertions, Assert::AssertionsModule::Proc
    end

    settings = Settings.new
    Settings::Environment::Set.(settings)

    run = Run.new
    run.settings = settings

    main_object = TOPLEVEL_BINDING.receiver
    main_object.extend TestBench::Structure

    Run::Registry.put run, main_object
  end
end
