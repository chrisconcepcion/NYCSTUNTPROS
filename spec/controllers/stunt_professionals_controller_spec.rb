require 'spec_helper'

describe  StuntProfessionalsController do
	describe "GET index" do
		it "sets stunt coordinators variable" do
			coordinator1 = Fabricate(:stunt_coordinator)
			coordinator2 = Fabricate(:stunt_coordinator)
			coordinator3 = Fabricate(:stunt_coordinator)
			coordinator4 = Fabricate(:stunt_coordinator)
			coordinator5 = Fabricate(:stunt_coordinator)
			coordinator6 = Fabricate(:stunt_coordinator)
			coordinator7 = Fabricate(:stunt_coordinator)
			coordinator8 = Fabricate(:stunt_coordinator)
			coordinator9 = Fabricate(:stunt_coordinator)
			coordinator10 = Fabricate(:stunt_coordinator)
			coordinator11 = Fabricate(:stunt_coordinator)
			coordinator12 = Fabricate(:stunt_coordinator)
			coordinator13 = Fabricate(:stunt_coordinator)
			coordinator14 = Fabricate(:stunt_coordinator)
			coordinator15 = Fabricate(:stunt_coordinator)
			get :index
			expect(assigns(:stunt_coordinators)).to match_array([coordinator15, coordinator14, coordinator13, coordinator12, coordinator11])
		end
		it "sets male stunt actors variable" do
			male_stunt_actor1 = Fabricate(:male_stunt_actor)
			male_stunt_actor2 = Fabricate(:male_stunt_actor)
			male_stunt_actor3 = Fabricate(:male_stunt_actor)
			male_stunt_actor4 = Fabricate(:male_stunt_actor)
			male_stunt_actor5 = Fabricate(:male_stunt_actor)
			male_stunt_actor6 = Fabricate(:male_stunt_actor)
			female_stunt_actor1 = Fabricate(:female_stunt_actor)
			female_stunt_actor2 = Fabricate(:female_stunt_actor)
			female_stunt_actor3 = Fabricate(:female_stunt_actor)
			get :index
			expect(assigns(:male_stunt_actors)).to eq [male_stunt_actor6, male_stunt_actor5, male_stunt_actor4, male_stunt_actor3, male_stunt_actor2]
		end
		it "sets female stunt actors variable" do
			female_stunt_actor1 = Fabricate(:female_stunt_actor)
			female_stunt_actor2 = Fabricate(:female_stunt_actor)
			female_stunt_actor3 = Fabricate(:female_stunt_actor)
			female_stunt_actor4 = Fabricate(:female_stunt_actor)
			female_stunt_actor5 = Fabricate(:female_stunt_actor)
			female_stunt_actor6 = Fabricate(:female_stunt_actor)
			male_stunt_actor1 = Fabricate(:male_stunt_actor)
			male_stunt_actor2 = Fabricate(:male_stunt_actor)
			male_stunt_actor3 = Fabricate(:male_stunt_actor)
			get :index
			expect(assigns(:female_stunt_actors)).to eq [female_stunt_actor6, female_stunt_actor5, female_stunt_actor4, female_stunt_actor3, female_stunt_actor2]
		end
	end
end