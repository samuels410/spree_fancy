class Spree::UserMailer < ActionMailer::Base


  def contact_email(name,message,from_email,subject)
    @name = name
    @message = message
    mail(to: "samuels410@gmail.com", from: from_email, subject: subject)
  end

  protected

  def load_user(user)
    @user = user.is_a?(User) ? user : User.find(user)
  end


end
