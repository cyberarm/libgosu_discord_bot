module LibGosu
  class Configuration
    ROOT_PATH = File.expand_path("./..", __dir__)

    attr_reader :hash, :token, :messages, :channels

    def initialize
      @hash = JSON.parse(File.read("#{ROOT_PATH}/data/config.json")).freeze

      @token = @hash["discord_bot_token"]

      @messages = @hash["messages"]

      @channels = @hash["channels"]
    end
  end
end
