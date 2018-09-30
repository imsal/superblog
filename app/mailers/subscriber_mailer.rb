class SubscriberMailer < ApplicationMailer

  def send_subscription_confirmation(email)
    mail(
      to: email,
      subject: 'Welcome to the family!'
    )
  end


  def account_activation(subscriber)
    @subscriber = subscriber
    @greeting = "Hi"

    mail to: subscriber.email, subject: 'Account Activation'
  end

end
