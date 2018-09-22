class SubscribeController < ApplicationController

  include SendWelcomeEmail

  def create

    email_address = params["sub"][:email_address]

    response = response_for_adding_new_subscriber(email_address)

    # if response[:error_count] == 0
    #   redirect_back fallback_location: root_url, notice: 'You have subscribed! Yay!'
    # else
    #   error_message = response[:errors][0][:message]
    #   redirect_back fallback_location: root_url, alert: "Your subscription failed. #{error_message}"
    # end

    # retrieve transactional template
    html_content, html_subject = retrieve_transactional_template

    # send email based off transactional template
    send_transactional_email(email_address, html_subject, html_content)

    # redirect_to root_url

  end


end
