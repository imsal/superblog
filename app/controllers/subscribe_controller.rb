class SubscribeController < ApplicationController

  # require 'uri'
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

    evaluated_response = eval(response.body)

    if evaluated_response[:error_count] == 0
      redirect_back fallback_location: root_url, notice: 'You have subscribed! Yay!'
    else
      error_message = evaluated_response[:errors][0][:message]
      redirect_back fallback_location: root_url, alert: "Your subscription failed. #{error_message}"
    end


    # byebug

    #final_response = response.read_body # use final response for error handling -- if error_count > 0 ....

    ### try retrieve_transactional_template

    # template_url = "d-8cfd1172c1bf4a6ea3369044cade8606"
    # url = URI("https://api.sendgrid.com/v3/templates/#{template_url}")
    #
    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #
    # request = Net::HTTP::Get.new(url)
    # request["authorization"] = "Bearer #{Rails.application.credentials.dig(:send_grid, :api_key)}"
    # request.body = "{}"
    #
    # response = http.request(request)
    # puts response.read_body

    # if final_response

  end


  private

  def retrieve_transactional_template
    id = 'd-8cfd1172c1bf4a6ea3369044cade8606'


  end

end
