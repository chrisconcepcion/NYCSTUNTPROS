class CreditsController < ApplicationController
	respond_to :json 
	
	def index
		respond_with current_user.profile.credits
	end
	
	def create
		respond_with @credit = Credit.create(credit_params.merge!(profile_id: current_user.profile.id))
	end
	
	def destroy
		respond_with @credit = current_user.profile.credits.destroy(params[:id])
	end
	
	def update
		respond_with @credit = current_user.profile.credits.find_by(params[:id])
		@credit.update(credit_params)
	end
	
private
	def credit_params
		params.require(:credit).permit(:media_category, :television, :project_name, :role, :company, :start_year, :end_year)
	end
end