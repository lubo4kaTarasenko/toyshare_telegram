class MessageHandler
  def self.call(bot, message)
    if message.respond_to?(:text)
      Logger.info(message)

      if message.text.start_with?('/start')
        email = Base64.decode64(message.text.split('/start').join.strip)
        Logger.info(email)
        
        bot.api.send_message(chat_id: message.chat.id, text: "Hi, #{message.from.first_name} (#{email})") rescue nil
  
        Webhook.notify(email, message.chat.id)
      end
    else 
      true  
    end
  rescue StandardError => ex
    Logger.info(ex.message)
    Logger.info(ex.backtrace.join("\n"))
  end
end