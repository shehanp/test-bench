module TestBench
  def self.activate
    # Get the top-level object (i.e. 'main')
    main_object = TOPLEVEL_BINDING.receiver

    # Get the global extension list; attach default output subsystem
    list = Extension::List::Global
    list.add TestBench::Output

    # Construct the publisher used for the test run
    publisher = Event::Publish.build

    # Subscribe all extensions to this publisher
    list.subscribe publisher

    # Bind the top-level object (`main') to this publisher
    Event::Publish::Registry::Global.put publisher, main_object

    # Adds context, test, comment, etc. to the top-level object (`main')
    main_object.extend TestBench::Structure

    # Link the assertions module for procs to the top-level Proc namespace, so
    # that this works:
    #
    # assert proc { ... } do
    #   raises?
    # end
    ::Proc.class_exec do
      const_set :Assertions, Assert::AssertionsModule::Proc
    end
  end
end
