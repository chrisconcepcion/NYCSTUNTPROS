class ResetPassword

    def initialize(user)
      @user = user 
    end
    
  def reset_password
      @user.generate_token(:reset_password_token)
      UserMailer.delay.reset_password(@user)
  end
end