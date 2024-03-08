module LibGosu
  class DiscordBot
    def initialize
      @config = Configuration.new

      @bot = Discordrb::Bot.new(token: @config.token)

      configure_callbacks

      run
    end

    def configure_callbacks
      # @bot.message(with_text: 'Ping!') do |event|
      #   event.respond 'Pong!'
      # end

      @bot.member_join do |event|
        msg = @config.messages["join_server"].sub("$USER", event.user.username)
        @bot.send_message(@config.channels["introduce_yourself_channel"], msg)
      end

      @bot.member_leave do |event|
        msg = @config.messages["join_server"].sub("$USER", event.user.mention)
        @bot.send_message(@config.channels["introduce_yourself_channel"], msg)
      end
    end

    def run
      @bot.run
    end
  end
end
