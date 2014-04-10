class UsersController < ApplicationController

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

private
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :middle_name, :last_name, :gender, :roles)
    end
    
end