require 'spec_helper'

describe EmploymentsController do
	describe "GET show" do
		before { current_user.create_profile }
		it_behaves_like "when user is not authenticated" do
			let(:action) {  get :show, id: "not a real id", employment: {}, :format => :json }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { 	get :show, id: "not a real id", employment: {}, :format => :json }
		end
		it "sets the employments variable" do
			get :show, id: current_user.profile.id, :format => :json
			expect(assigns(:employment)).to eq current_user.profile.employment
		end
	end
	describe "POST update" do
		before { current_user.create_profile }
		it_behaves_like "when user is not authenticated" do
			let(:action) { 	post :update, id: "not a real id", employment: { id:"fake id"}, :format => :json }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { 	post :update, id: "not a real id", employment: {}, :format => :json }
		end
		it "updates a users employment information" do
			update_information = { id: current_user.profile.employment.id, skills: "weight lifting specialist", training: "School of Something Magical", work_history: "everywhere and everything", job_categories: "athletic", past_job_titles: "Gym Manager", primary_citizenship: "USA", work_unpaid: true, united_states_citizenship: true, valid_passport: false }
			post :update, id: current_user.profile.employment.id,  employment:  update_information, :format => :json
			update_information.each do |key, value|
				expect(current_user.profile.employment[key]).to eq update_information[key]
			end
		end
		it "returns a users employment information" do
			update_information = { id: current_user.profile.employment.id, skills: "weight lifting specialist", training: "School of Something Magical", work_history: "everywhere and everything", job_categories: "athletic", past_job_titles: "Gym Manager", primary_citizenship: "USA", work_unpaid: true, united_states_citizenship: true, valid_passport: false }
			post :update, id: current_user.profile.employment.id,  employment:  update_information, :format => :json
			expect(response.body).to eq current_user.profile.employment.to_json
		end
	end
end