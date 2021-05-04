class Config
  def self.token
    ENV['TELEGRAM_TOYSHARE_TOKEN']
  end

  def self.webhook_uri
    URI("#{webhook_domain}/telegram_webhook")
  end

  def self.webhook_domain
    ENV['TOYSHARE_URL']
  end
end
