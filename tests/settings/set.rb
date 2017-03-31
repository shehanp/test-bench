require_relative '../test_init'

context "Settings" do
  context "Set" do
    settings = TestBench::Settings.new

    context "Settings of receiver are present on settings instance" do
      receiver = OpenStruct.new
      receiver.settings = %i(abort_on_error)

      settings.set receiver

      test "Value of receiver is set to that of settings instance" do
        assert receiver.abort_on_error == settings.abort_on_error
      end
    end

    context "Settings of receiver are absent on settings instance" do
      receiver = OpenStruct.new
      receiver.settings = %i(not_a_setting)

      test "Error is raised" do
        begin
          settings.set receiver
        rescue TestBench::Settings::InvalidSettingError => error
        end

        refute error.nil?
      end
    end
  end
end
