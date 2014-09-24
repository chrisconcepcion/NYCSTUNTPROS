require 'spec_helper'

describe MaleStuntActorController do
	describe "GET index" do
		it "sets male_stunt_actors variable" do
			male_stunt_actor1 = Fabricate(:male_stunt_actor)
			male_stunt_actor2 = Fabricate(:male_stunt_actor)
			male_stunt_actor3 = Fabricate(:male_stunt_actor)
			male_stunt_actor4 = Fabricate(:male_stunt_actor)
			male_stunt_actor5 = Fabricate(:male_stunt_actor)
			male_stunt_actor6 = Fabricate(:male_stunt_actor)
			get :index
			expect(assigns(:male_stunt_actors)).to match_array( [male_stunt_actor1, male_stunt_actor2, male_stunt_actor3, male_stunt_actor4, male_stunt_actor5, male_stunt_actor6])
		end
	end
	describe "GET search" do
		it "sets search variable" do
				user1 = Fabricate(:male_stunt_actor, last_name: 'Batman 1')
				user2 = Fabricate(:male_stunt_actor, first_name: 'Batman 2' )
				user3 = Fabricate(:female_stunt_actor, first_name: 'Monk')
				user4 = Fabricate(:female_stunt_actor, middle_name: 'South Park')
				get :search, keyword: "Batman"
				expect(assigns(:search)).to eq [user2, user1]
		end
		it "displays flash notice if search has no results" do
				get :search, keyword: ""
				expect(flash[:notice]).to eq "No users have been found."
		end
	end
	describe "GET advance_search" do
		context
	end
end