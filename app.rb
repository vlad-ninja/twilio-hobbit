require 'hobbit'
require 'rack/env'
require 'hobbit/contrib'

require_relative 'services/utilities'
require_relative 'services/twilio'

class App < Hobbit::Base
  use Rack::Static, urls: ["/css", "/js"], root: "public"
  use Rack::Env
  include Hobbit::Render

  get '/' do
    render 'index', {}, layout: false
  end

  post '/send_sms/:phone' do
    phone = Util.format_phone_number(request.params[:phone])

    if phone
      weather = Util.get_weather
      message = "Current Weather in Melbourne. #{weather[:temp]}°C, #{weather[:status]}"
      Sms.send_to(phone, message)
    else
      response.status = 422
    end

    halt response.finish
  end

end


