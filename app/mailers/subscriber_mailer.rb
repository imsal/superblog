class SubscriberMailer < ApplicationMailer

  def send_subscription_confirmation(email)
    mail(
      to: email,
      subject: 'Welcome to the family!'
    )
  end

end
