class UserMailer < ActionMailer::Base
  default from: 'info@nycstuntpros.com'
    
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to NYCSTUNTPROS!")
  end
    
  def reset_password(user)
      @user = user
      mail(to: @user.email, subject: "Reset your password for NYCSTUNTPROS")
    end
       
end