class MaleStuntActorController < ApplicationController
	def index
		@male_stunt_actors = User.stunt_actors("male")
	end
	def search
		@search = User.search_by_full_name(params[:keyword], "male")
		@keyword = params[:keyword]
		if @search == []
			flash[:notice] = "No users have been found."
		end
	end
end