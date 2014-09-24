class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
    
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
	def already_authenticated
  	redirect_to root_path if current_user
  end

  def require_authentication
  	if current_user == nil
			flash[:error] = "Only authenticated users can preform this action, please sign in."
			redirect_to login_path
		end
	end
	
	def require_password_reset_token
		user = User.find_by_reset_password_token params[:reset_password_token]
		redirect_to invalid_token_path unless user && user.reset_password_sent_at
  end
	
	def require_password_reset_sent_at_less_than_2_hours_ago
		user = User.find_by_reset_password_token params[:reset_password_token]
		if user && user.reset_password_sent_at
			if user.reset_password_sent_at < 2.hours.ago
    		redirect_to reset_password_path
				flash[:error] = "Reset password token has expired. Please go request to reset your password again and complete the process within 2 hours."
			end
		else 
			redirect_to invalid_token_path
		end
  end
	
	def require_owner
		if current_user.id.to_s == params[:id]
		elsif params[:controller] == "profiles"
			if current_user.profile.id.to_s == params[:id]
			else
				flash[:error] = "You're not allowed to preform that action."
				redirect_to root_path
			end
		else
			flash[:error] = "You're not allowed to preform that action."
			redirect_to root_path
		end
	end
end
