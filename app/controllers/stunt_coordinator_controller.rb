class StuntCoordinatorController < ApplicationController
	def index
		@stunt_coordinators = User.stunt_coordinators.paginate(:page => params[:page], :per_page => 25)
	end
end