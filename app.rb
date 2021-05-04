require 'telegram/bot'
require 'base64'
require 'pry'
require 'net/http'

require_relative 'app/config'
require_relative 'app/logger'
require_relative 'app/webhook'
require_relative 'app/message_handler'

Logger.info('App started')

Telegram::Bot::Client.run(Config.token) do |bot|
  bot.listen do |message|
    MessageHandler.call(bot, message)
  end
end
