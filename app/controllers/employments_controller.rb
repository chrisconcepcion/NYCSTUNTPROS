class EmploymentsController < ApplicationController
	respond_to :json 
	before_action :require_authentication, only: [:show, :update]
	before_action :require_owner, only: [:show, :update]
	
	def show
		profile = Profile.find_by_id params[:id]
		respond_with @employment = profile.employment
	end
	
	def update
		employment = Employment.find_by_id(employment_params[:id])
		employment.update(employment_params)
		respond_with employment
	end
private
	def employment_params 
		params.require(:employment).permit(:skills, :training, :work_history, :job_categories, :past_job_titles, :primary_citizenship, :united_states_citizenship, :valid_passport, :work_unpaid, :id)
	end
end