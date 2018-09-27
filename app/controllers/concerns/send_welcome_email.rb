module SendWelcomeEmail

  require 'net/http'

  def response_for_adding_new_subscriber(email_address)


    url = URI("https://api.sendgrid.com/v3/contactdb/recipients")

    http = Net::HTTP.new(url.host, url.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["authorization"] = "Bearer #{Rails.application.credentials.dig(:send_grid, :api_key)}"
    request["content-type"] = 'application/json'
    request.body = "[{\"email\":\"#{email_address}\"}]"

    response = http.request(request)

    evaluated_response_for_subscription = eval(response.body)

    if evaluated_response_for_subscription[:error_count] == 0
      return evaluated_response_for_subscription
    else
      error_message = evaluated_response_for_subscription[:errors][0][:message]
      redirect_back fallback_location: root_url, alert: "Your subscription failed. #{error_message}"
      logger.debug "Subscriber Failure: email address entered: #{email_address} -- #{evaluated_response_for_subscription}"
    end

  end

  def retrieve_transactional_template
    transactional_id = 'd-8cfd1172c1bf4a6ea3369044cade8606'

    transactional_template = [
      'd-8cfd1172c1bf4a6ea3369044cade8606' # welcome email for new subscribers
    ]

    url = URI("https://api.sendgrid.com/v3/templates/#{transactional_id}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = "Bearer #{Rails.application.credentials.dig(:send_grid, :api_key)}"
    request.body = "{}"

    response = http.request(request)

    evaluated_response_of_transactional_tempalate = eval(response.read_body)

    html_content = evaluated_response_of_transactional_tempalate[:versions][0][:html_content]
    html_subject = evaluated_response_of_transactional_tempalate[:versions][0][:subject]

    # if response[:error_count] == 0
    #   redirect_back fallback_location: root_url, notice: 'You have subscribed! Yay!'
    # else
    #   error_message = response[:errors][0][:message]
    #   redirect_back fallback_location: root_url, alert: "Your subscription failed. #{error_message}"
    # end

    return html_content, html_subject

  end


  def send_transactional_email(email_address, html_subject, html_content)
    url = URI("https://api.sendgrid.com/v3/mail/send")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["authorization"] = "Bearer #{Rails.application.credentials.dig(:send_grid, :api_key)}"
    request["content-type"] = 'application/json'

    html_content.gsub!(/\n/, '')

    request.body = "{\"personalizations\":[{\"to\":[{\"email\":\"#{email_address}\"}],\"subject\":\"#{html_subject}\"}],\"from\":{\"email\":\"s.tardibuono@live.com\",\"name\":\"Prove Your Wealth\"},\"content\":[{\"type\":\"text/html\",\"value\":\"#{html_content}\"}]}"

    response = http.request(request)

    redirect_back fallback_location: root_url, notice: "You are now a subscriber. Yay!"

    # evaluated_send_mail_response = eval(response.body)
    #
    # if evaluated_send_mail_response[:error_count] == 0
    #   redirect_back fallback_location: root_url, notice: 'You have subscribed! Yay!'
    # else
    #   error_message = evaluated_send_mail_response[:errors][0][:message]
    #   redirect_back fallback_location: root_url, alert: "Your subscription failed. #{error_message}"
    # end

  end

end
