class Logger
  def self.info(text)
    puts "[#{Time.now.strftime('%x %X')}] #{text}"
  end
end