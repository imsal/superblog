class SubscribeController < ApplicationController

  require 'uri'
  require 'net/http'

  def new
  end

  def create

    email_address = params["sub"][:email_address]

    url = URI("https://api.sendgrid.com/v3/contactdb/recipients")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["authorization"] = "Bearer #{Rails.application.credentials.dig(:send_grid, :api_key)}"
    request["content-type"] = 'application/json'
    request.body = "[{\"email\":\"#{email_address}\"}]"

    response = http.request(request)

    final_response = response.read_body # use final response for error handling -- if error_count > 0 ....

    # if final_response
    redirect_to root_url, notice: 'You have subscribed! Yay!'
  end

end
