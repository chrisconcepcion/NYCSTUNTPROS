class UsersController < ApplicationController

	def new
		@user = User.new
	end
    
    def create
        @user = User.create(user_params)
        if @user.save
            @user.create_profile
            redirect_to "/"
            flash[:notice] = "Thanks for signing up! Now sign in with your credentials."
        else
            render :new
        end
    end

private
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :middle_name, :last_name, :gender)
    end
    
end