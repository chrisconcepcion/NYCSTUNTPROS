class ProfilesController < ApplicationController
	before_action :require_authentication, only: [:edit, :update]
	before_action :require_owner, only: [:edit, :update]
	respond_to :json
	def show
		@profile = User.find_by_id(params[:id]).profile
		respond_to do |format|
      format.html
      format.json { render json: @profile }
    end
	end
	
	def edit
		@profile = User.find_by_id(params[:id]).profile
	end
	
	def update
		@profile = User.find_by_id(params[:id]).profile
		@profile.update(profile_params)
		if @profile.save && profile_params[:photo].present?
			render :crop
		elsif @profile.save && !profile_params[:photo].present?
			@profile.reprocess_photo
			respond_to do |format|
  			format.html { redirect_to edit_profile_path }
  			format.json { render json: @user }
			end
			flash[:notice] = "Your profile has been succesfully updated."
		else
			render :edit
		end
	end
	
private
	def profile_params
		params.require(:profile).permit(:id, :photo, :crop_x, :crop_y, :crop_w, :crop_h, :height, :physique, :ethnicity, :eye_color, :hair_color, :hair_length, :shirt_neck, :shirt_sleeve, :suit_dress_size, :pants_waist, :pants_inseam, :shoe_size, :hat_size, :glove_size, :weight)
	end


end

def photo_resize?
	(profile_params[:crop_x].present? && profile_params[:crop_y].present? && profile_params[:crop_w].present? && profile_params[:crop_h].present?)
end