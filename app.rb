require 'telegram/bot'
require 'base64'
require 'pry'
require 'net/http'

token = ENV['TELEGRAM_TOYSHARE_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.text.start_with?('/start')
      email = Base64.decode64(message.text.split('/start').join.strip)
      bot.api.send_message(chat_id: message.chat.id, text: "Hi, #{message.from.first_name} (#{email})")
      data = { email: email, chat_id: message.chat.id }

      uri = URI("#{ENV['TOYSHARE_URL']}/telegram_webhook")
    end
  end
end