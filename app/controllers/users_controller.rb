class UsersController < ApplicationController
before_action :already_authenticated, only: [:new, :create]
before_action :require_authentication, only: [:edit, :update]
before_action :require_owner, only: [:edit, :update]
  def new
		@user = User.new
	end
    
  def create
    @user = User.create(user_params)
    if @user.save
      SignUp.new(@user).sign_up
      redirect_to root_path
      flash[:notice] = "Thanks for signing up! Now sign in with your credentials."
    else
      render :new
    end
  end
	
	def edit
		@user = User.find_by(id: params[:id] )
	end
	
	def update
		@user = User.find_by(id: params[:id] )
		update = UpdateUser.new(@user, user_params).update_user
		if update.successful?
			redirect_to root_path
			flash[:notice] = "Your account has been updated."
		else
			flash[:error] = update.error_message
			render :new
		end
	end
	
	
private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :gender, :roles, :date_of_birth )
  end
end