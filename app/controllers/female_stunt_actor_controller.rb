class FemaleStuntActorController < ApplicationController
	def index
		@female_stunt_actors = User.stunt_actors("female")
	end
	def search
		@search = User.search_by_full_name(params[:keyword], "female")
		@keyword = params[:keyword]
		if @search == []
			flash[:notice] = "No users have been found."
		end
	end
end