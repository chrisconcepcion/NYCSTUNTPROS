require 'spec_helper'

describe CreditsController do
	describe "GET index" do
		before { current_user.create_profile }
		it "returns all credits associated with a user" do
			credit1 = Fabricate(:credit, profile: current_user.profile)
			credit2 = Fabricate(:credit, profile: current_user.profile)
			credit3 = Fabricate(:credit, profile: current_user.profile)
			get :index, :format => :json
			expect(response.body).to eq [credit1,credit2,credit3].to_json
		end
	end
	describe "POST create" do
		before { current_user.create_profile }
		it "creates a credit" do
			post :create, credit: Fabricate.attributes_for(:credit), :format => :json
			expect(current_user.profile.credits.count).to eq 1
		end
		it "returns credit information" do
			post :create, credit: Fabricate.attributes_for(:credit), :format => :json
			expect(response.body).to eq current_user.profile.credits.first.to_json
		end
	end
	describe "DELETE destroy" do
		before { current_user.create_profile }
		it "destroys a credit" do
			credit = Fabricate(:credit, profile: current_user.profile)
			delete :destroy, id: credit.id, :format => :json
			expect(current_user.profile.credits.count).to eq 0
		end
	end
	describe "PATCH update" do
		before { current_user.create_profile }
		it "destroys a credit" do
			credit = Fabricate(:credit, media_category: "film", project_name: "Batman", role: "Gary", company: "Warner Bros", start_year: 1990, end_year: 1999, profile: current_user.profile)
			patch :update, id: credit.id, credit: { media_category: "film", project_name: "Batman", role: "Barry", company: "Warner Bros", start_year: 1992, end_year: 2000 }, :format => :json
			expect{credit.reload}.to change{[credit.media_category, credit.project_name, credit.role, credit.company, credit.start_year, credit.end_year]}.from(["film", "Batman", "Gary", "Warner Bros",1990, 1999]).to( ["film", "Batman", "Barry","Warner Bros", 1992, 2000])
		end
	end
end