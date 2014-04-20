class StuntCoordinator < ApplicationController
	def index
		@stunt_coordinators = User.stunt_coordinators
	end
end