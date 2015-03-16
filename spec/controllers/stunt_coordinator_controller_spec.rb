require 'spec_helper'

describe StuntCoordinatorController do
	describe "GET index" do
		it "sets stunt_coordinator variable" do
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
			expect(assigns(:stunt_coordinators)).to eq [coordinator1, coordinator2, coordinator3, coordinator4, coordinator5, coordinator6, coordinator7, coordinator8, coordinator9, coordinator10, coordinator11, coordinator12, coordinator13, coordinator14, coordinator15]
		end
	end
end