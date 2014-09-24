class UpdatePasswordController < ApplicationController
before_action :require_password_reset_token, only: [:new, :create]
before_action :require_password_reset_sent_at_less_than_2_hours_ago, only: [:new, :create]
before_action :already_authenticated, only: [:new, :create]

	def new
		@user = User.find_by_reset_password_token params[:reset_password_token]
	end
	
  def create
	  user = User.find_by_reset_password_token params[:reset_password_token]
	  if user.update_password( params[:password], params[:password_confirmation] )
	  	redirect_to root_path
	  	flash[:notice] = "Your password have been updated. Log in with your new password."
  	else
	  	redirect_to :action => "new", :reset_password_token => (params[:reset_password_token])
	  	flash[:error] = "Password and Password Confirmation must match and be 6 characters or longer."
  	end
  end
end