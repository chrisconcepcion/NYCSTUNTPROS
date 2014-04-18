class SessionsController < ApplicationController
before_action :already_authenticated, only: [:new, :create]
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash[:notice] = "You have successfully logged in!"
      redirect_to root_url
    else
      flash[:error] = "Invalid email or password"
      render "new"
    end
  end

    

	def destroy
		cookies.delete(:auth_token)
        flash[:notice] = "You have successfully logged out."
		redirect_to root_path
	end
end