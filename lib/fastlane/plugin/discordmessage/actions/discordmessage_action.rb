require 'fastlane/action'
require_relative '../helper/discordmessage_helper'
require 'discordrb/webhooks'

module Fastlane
  module Actions
    class DiscordmessageAction < Action
      def self.run(params)
        self.notificate(params)
      end

      def self.notificate(params)
        client = Discordrb::Webhooks::Client.new(url: params[:webhook])
        client.execute do |builder|
          if params[:content]
            builder.content = params[:content]
          end
          builder.add_embed do |embed|
            if params[:title]
              embed.title = params[:title]
            end
            if params[:color]
              embed.colour = self.getColor(params[:color])
            end
            if params[:link]
              embed.url = params[:link]
            end
            if params[:decription]
              embed.description = params[:decription]
            end
            if params[:header] and params[:link] and params[:icon_url]
              embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: params[:header], url: params[:link], icon_url: params[:icon_url])
            end
            embed.timestamp = Time.now
          end
        end
      end

      def self.getColor(value)
        if value == 'green'
          return 0x3c9b00
        end
        if value == 'yellow'
          return 0xffea00
        end
        if value == 'red'
          return 0xff0000
        end
        if value == 'black'
          return 0x000000
        end
      end


      def self.description
        "Send a generic message to discord"
      end

      def self.authors
        ["André Marzo"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :webhook,
                               description: "Webhook URL",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :header,
                               description: "Header",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :color,
                               description: "Color",
                                  optional: true,
                                      type: String,
                             default_value: 'black'),
          FastlaneCore::ConfigItem.new(key: :link,
                               description: "link of app",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :title,
                               description: "title of notification",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :icon_url,
                               description: "icon URL",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :decription,
                               description: "description short",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :content,
                               description: "content",
                                  optional: true,
                                      type: String),
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
