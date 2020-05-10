describe Fastlane::Actions::DiscordmessageAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The discordmessage plugin is working!")

      Fastlane::Actions::DiscordmessageAction.run(nil)
    end
  end
end
