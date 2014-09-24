class MaleStuntActorController < ApplicationController
	def index
		@male_stunt_actors = User.stunt_actors("male").paginate(:page => params[:page], :per_page => 25)
	end
	def search
		@search = User.search_actors_by_full_name(params[:keyword], "male").paginate(:page => params[:page], :per_page => 25)
		@keyword = params[:keyword]
		if @search == []
			flash[:notice] = "No users have been found."
		end
	end
	
	def advanced_search
		@q = User.stunt_actors("male").ransack(params[:q])
    @results = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 25)
	end
end