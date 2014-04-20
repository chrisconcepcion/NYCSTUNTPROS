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
			expect(assigns(:male_stunt_actors)).to eq [male_stunt_actor1, male_stunt_actor2, male_stunt_actor3, male_stunt_actor4, male_stunt_actor5, male_stunt_actor6]
		end
	end
	describe "GET search" do
		context "when authenticated" do
			it "sets search variable" do
				user1 = Fabricate(:user, gender: "male", first_name: 'Batman', last_name:"Revenge")
				user2 = Fabricate(:user, gender: "male", first_name: 'Batman', last_name:"2" )
				user3 = Fabricate(:user, first_name: 'Firsty', last_name:"Revenge")
				user4 = Fabricate(:user, first_name: 'Ramp', last_name:"coocoo")
				get :search, keyword: "Batman"
				expect(assigns(:search)).to match_array([user1, user2])
			end
			it "displays flash notice if search has no results" do
				get :search, keyword: ""
				expect(flash[:notice]).to eq "No users have been found."
			end
		end
	end
end