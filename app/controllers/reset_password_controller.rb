class ResetPasswordController < ApplicationController
before_action :already_authenticated, only: [:new, :create]
  def create
    user = User.find_by(email: params[:email])
    if user 
        ResetPassword.new(user).reset_password
        redirect_to reset_password_confirmation_path
    else
        redirect_to reset_password_path
        flash[:error] = "Invalid Email Address."
    end
  end
end