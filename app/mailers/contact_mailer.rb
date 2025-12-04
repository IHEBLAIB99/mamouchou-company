class ContactMailer < ApplicationMailer
  default to: 'mamochoucompany@gmail.com'

  def submission_email
    @name = params[:name]
    @sender_email = params[:email]
    @phone = params[:phone]
    @message = params[:message]

    mail(subject: "New contact from #{@name} (@#{@sender_email})")
  end
end
