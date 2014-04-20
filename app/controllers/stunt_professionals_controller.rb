class StuntProfessionalsController < ApplicationController
	def index
		@stunt_coordinators = User.stunt_coordinators_recent_5
		@male_stunt_actors = User.stunt_actors_recent_5("male")
		@female_stunt_actors = User.stunt_actors_recent_5("female")
	end
	
end