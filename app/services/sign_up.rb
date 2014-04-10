class SignUp
  def initialize(user)
    @user = user
  end
  
  def sign_up
    @user.create_profile
    UserMailer.delay.welcome_email(@user) 
  end
end