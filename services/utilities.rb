require 'net/http'
require 'json'

class Util

  def self.format_phone_number(phone)
    phone = URI.decode(phone).gsub(/\D/,'')
    if phone[0] == '0' && phone.length == 10
      '+61' << phone[1..-1]
    elsif phone[0..1] == '61'
      '+' << phone
    else
      false
    end
  end

  def self.get_weather
    uri = URI('http://api.openweathermap.org/data/2.5/weather?q=Melbourne&units=metric')
    res = Net::HTTP.get_response(uri)
    data = JSON.parse(res.body)
    data = {temp: data['main']['temp'].to_i, status: data['weather'][0]['description']}
  end

end
