require 'telegram/bot'
require 'base64'
require 'pry'
require 'net/http'

token = ENV['TELEGRAM_TOYSHARE_TOKEN']

puts "[#{Time.now}] started"

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    pp message.text
 
    if message.text.start_with?('/start')
      email = Base64.decode64(message.text.split('/start').join.strip)
      bot.api.send_message(chat_id: message.chat.id, text: "Hi, #{message.from.first_name} (#{email})")
      data = { email: email, chat_id: message.chat.id }

      pp email
      uri = URI("#{ENV['TOYSHARE_URL']}/telegram_webhook")
      res = Net::HTTP.post_form(uri, *data)
      puts res.body
    end
  end
end