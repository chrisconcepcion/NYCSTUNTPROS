class UpdatePasswordController < ApplicationController 
	def new
		@user = User.find_by_reset_password_token params[:id]
		if (@user == nil)
			redirect_to invalid_token_path 
		end
	end
	
def create
	@user = User.find_by_reset_password_token params[:reset_password_token]
	if (params[:password] == params[:password_confirmation])
		if @user.reset_password_sent_at < 2.hours.ago
    	redirect_to reset_password_path
			flash[:error] = "Reset password token has expired."
		elsif @user.update_attributes(password: params[:password])
			redirect_to root_path
			flash[:notice] = "Your password have been updated. Log in with your new password."
		else
			render :new
		end
	else
		render :new
		flash[:error] = "Password and Password Confirmation must match."
	end
end
end