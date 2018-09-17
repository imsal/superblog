module NewSubscriber

  def 

  def create

    require 'uri'
    require 'net/http'

    api_key = Rails.application.credentials.dig(:send_grid, :api_key)

    url = URI("https://api.sendgrid.com/v3/contactdb/recipients")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["authorization"] = "Bearer #{api_key}"
    request["content-type"] = 'application/json'
    request.body = "[{\"email\":\"#{email_address}\"}]"

    response = http.request(request)
    response.read_body
  end

end
