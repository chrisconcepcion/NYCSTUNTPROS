class SessionsController < ApplicationController
    
  def create
		user = User.find_by(email:(params[:email]))
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
            redirect_to root_path, notice: "You have successfully logged in!"
		else
			flash[:error] =  "Unable to find username and password combination"
			redirect_to root_path
		end

	end

	def destroy
		session[:user_id] = nil
        flash[:notice] = "You have successfully logged out."
		redirect_to root_path
	end
    
end