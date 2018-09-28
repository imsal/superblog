class InquiryMailer < ApplicationMailer

  def send_automated_inquiry_response(email, name, message)
    @name = name
    @message = message

    mail(
      to: email,
      subject: 'We received your inquiry'
    )
  end

  def alert_company_of_inquiry(email, name, message)
    @name = name
    @email = email
    @message = message
    @time = Time.now

    mail(
      to: 's.tardibuono@live.com',
      subject: "#{@name} has an Inquiry"
    )
  end

end
