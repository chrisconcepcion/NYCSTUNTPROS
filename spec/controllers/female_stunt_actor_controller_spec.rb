require 'spec_helper'

describe FemaleStuntActorController do
	describe "GET index" do
		it "sets female_stunt_actors variable" do
			female_stunt_actor1 = Fabricate(:female_stunt_actor)
			female_stunt_actor2 = Fabricate(:female_stunt_actor)
			female_stunt_actor3 = Fabricate(:female_stunt_actor)
			female_stunt_actor4 = Fabricate(:female_stunt_actor)
			female_stunt_actor5 = Fabricate(:female_stunt_actor)
			female_stunt_actor6 = Fabricate(:female_stunt_actor)
			get :index
			expect(assigns(:female_stunt_actors)).to match_array( [female_stunt_actor1, female_stunt_actor2, female_stunt_actor3, female_stunt_actor4, female_stunt_actor5, female_stunt_actor6])
		end
	end
	describe "GET search" do
		context "when authenticated" do
			it "sets search variable" do
				user1 = Fabricate(:female_stunt_actor, last_name: 'Batman 1')
				user2 = Fabricate(:female_stunt_actor, first_name: 'Batman 2' )
				user3 = Fabricate(:male_stunt_actor, first_name: 'Monk')
				user4 = Fabricate(:male_stunt_actor, middle_name: 'South Park')
				get :search, keyword: "Batman"
				expect(assigns(:search)).to eq [user2, user1]
			end
			it "displays flash notice if search has no results" do
				get :search, keyword: ""
				expect(flash[:notice]).to eq "No users have been found."
			end
		end
	end
end
