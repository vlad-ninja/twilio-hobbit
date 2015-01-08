require 'twilio-ruby'

Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_SID']
  config.auth_token = ENV['TWILIO_TOKEN']
end

class Sms

  def self.send_to(phone, message)
    client = Twilio::REST::Client.new
    client.messages.create(
      from: '+61427590593',
      to: phone,
      body: message
    )
  end

end
