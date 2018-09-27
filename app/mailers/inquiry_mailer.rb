class InquiryMailer < ApplicationMailer

  def send_automated_inquiry_response(email, name, message)
    @name = name
    @message = message
    
    mail(
      to: email,
      subject: 'We received your inquiry'
    )
  end

end
