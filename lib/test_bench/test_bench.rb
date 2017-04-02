module TestBench
  def self.activate
    # Get the top-level object (i.e. 'main')
    main_object = TOPLEVEL_BINDING.receiver

    # Construct the run object used for the test run
    run = Run.build

    # Bind the top-level object to this run instance
    Run::Registry.put run, main_object

    # Adds context, test, comment, etc. to the top-level object
    main_object.extend TestBench::Structure

    # Link the assertions module for procs to the top-level Proc namespace, so
    # that this works:
    #
    # assert proc { ... } do
    #   raises_error?
    # end
    ::Proc.class_exec do
      const_set :Assertions, Assert::AssertionsModule::Proc
    end
  end
end
