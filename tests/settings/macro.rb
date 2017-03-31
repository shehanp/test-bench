require_relative '../test_init'

context "Settings" do
  context "Macro" do
    cls = Class.new do
      extend TestBench::Settings::Macro

      setting :some_setting
    end

    object = cls.new

    test "Writer attribute" do
      assert object.respond_to?(:some_setting=)
    end

    test "Reader attribute" do
      assert object.respond_to?(:some_setting)
    end

    test "Read and write" do
      object.some_setting = :some_value

      assert object.some_setting == :some_value
    end

    test "Attribute is added to settings list" do
      assert cls.settings.include?(:some_setting)
    end
  end
end
