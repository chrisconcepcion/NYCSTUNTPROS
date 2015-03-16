class CreditsController < ApplicationController
	respond_to :json 
	
	def index
		respond_with current_user.profile.credits
	end
	
	def create
		respond_with credit = Credit.create(credit_params.merge!(profile_id: current_user.profile.id))
	end
	
	def destroy
		credit = current_user.profile.credits.destroy(params[:id])
		respond_with credit 
	end
	
	def update
		credit = Credit.find_by_id(params[:id])
		credit.update(credit_params)
		respond_with credit
	end
	
private
	def credit_params
		params.require(:credit).permit(:media_category, :project_name, :role, :company, :start_year, :end_year, :id)
	end
end