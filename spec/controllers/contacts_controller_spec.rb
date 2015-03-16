require 'spec_helper'

describe ContactsController do
	describe "GET show" do
			before do 
				current_user.create_profile
				current_user.profile.contact.update!(address_line_1: "999 Google Ave", address_line_2: "apt elohel", city: "silicon valley", state: "CA", zip_code: "99999", phone_number: "1-800-Google", email: "google@google.com", website: "www.google.com")
			end
		it_behaves_like "when user is not authenticated" do
			let(:action) { 	get :show, id: "not a real id", :format => :json }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { 	get :show, id: "not a real id", :format => :json }
		end
		it "sets the contact variable" do
			get :show, id: current_user.profile.id, :format => :json
			expect(assigns(:contacts)).to eq current_user.profile.contact
		end
		it "returns a users contact information" do
			get :show, id: current_user.profile.id, :format => :json
			expect(response.body).to eq current_user.profile.contact.to_json
		end
	end
	describe "PATCH update" do
		before { current_user.create_profile }
		it_behaves_like "when user is not authenticated" do
			let(:action) { 	patch :update, id: "not a real id", :format => :json }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { 	patch :update, id: "not a real id", contact: {}, :format => :json }
		end
		it "updates a users contact information" do
			update_information = {id: current_user.profile.contact.id, address_line_1: "999 Google Ave", address_line_2: "apt elohel", city: "silicon valley", state: "CA", zip_code: "99999", phone_number: "1-800-Google", email: "google@google.com", website: "www.google.com" }
			post :update, id: current_user.profile.contact.id,  contact: update_information, :format => :json
			update_information.each do |key, value|
				expect(current_user.profile.contact[key]).to eq update_information[key]
			end
		end
		it "returns a users contact information" do
			update_information = {id: current_user.profile.contact.id, address_line_1: "999 Google Ave", address_line_2: "apt elohel", city: "silicon valley", state: "CA", zip_code: "99999", phone_number: "1-800-Google", email: "google@google.com", website: "www.google.com" }
			post :update, id: current_user.profile.contact.id,  contact: update_information, :format => :json
			expect(response.body).to eq current_user.profile.contact.to_json
		end
	end
end