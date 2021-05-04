class Webhook
  def self.notify(email, chat_id)
    res = Net::HTTP.post_form(Config.webhook_uri, email: email, chat_id: chat_id)
    Logger.info(res.code)
  end
end