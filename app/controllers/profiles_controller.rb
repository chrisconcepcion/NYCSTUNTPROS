class ProfilesController < ApplicationController
	before_action :require_authentication, only: [:edit, :update]
	before_action :require_owner, only: [:edit, :update]
	
	def show
		@profile = User.find_by_id(params[:id]).profile
	end
	def edit
		@profile = User.find_by_id(params[:id]).profile
	end
	def update
		if params[:angular]
		else
		@profile = Profile.find_by_id(params[:id])
		if photo_resize?
			@profile.update(profile_params)
		else	
			@profile.update(profile_params) && @profile.contact.update(contact_params) && @profile.employment.update(employment_params)
		end
		if @profile.save && @profile.contact.save && @profile.employment.save && profile_params[:photo].present?
				render :crop
		elsif @profile.save && @profile.contact.save&& @profile.employment.save && !profile_params[:photo].present?
				@profile.reprocess_photo
				redirect_to root_path
				flash[:notice] = "Your profile has been succesfully updated."
		else
			render :edit
		end
		end
	end
	
private
	def profile_params
		params.require(:profile).permit(:photo, :crop_x, :crop_y, :crop_w, :crop_h, :height, :physique, :ethnicity, :eye_color, :hair_color, :hair_length, :shirt_neck, :shirt_sleeve, :suit_dress_size, :pants_waist, :pants_inseam, :shoe_size, :hat_size, :glove_size, :weight)
	end

	def contact_params
		params.require(:contact).permit(:address_line_1, :address_line_2, :city, :state, :zip_code, :phone_number, :email, :website)
  end
	def employment_params 
		params.require(:employment).permit(:skills, :training, :work_history, :job_categories, :past_job_titles, :primary_citizenship, :work_unpaid, :united_states_citizenship, :valid_passport)
	end
end

def photo_resize?
	(profile_params[:crop_x].present? && profile_params[:crop_y].present? && profile_params[:crop_w].present? && profile_params[:crop_h].present?)
end