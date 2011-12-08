class UserMailer < ActionMailer::Base

  default :from => "mc.notifier@gmail.com"

  def password_reset_email(user)
    @user = user
    mail(:to => user.email, :subject => "MC password reset request")
  end

end
