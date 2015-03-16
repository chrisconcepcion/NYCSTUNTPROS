require 'spec_helper' 

describe ProfilesController do
	describe "GET show" do
		let(:user) { Fabricate(:user) }
		it "sets profile variable" do
			user.create_profile
			get :show, id: user.id
			expect(assigns(:profile)).to eq user.profile
		end
	end
	describe "GET edit" do
		before { current_user.create_profile }
		it_behaves_like "when user is not authenticated" do
			let(:action) { get :edit, id: "not_a_real_id" }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { get :edit, id: "not_a_real_id" }
		end
		it "sets profile variable" do
			get :edit, id: current_user.id
			expect(assigns(:profile)).to eq current_user.profile
		end
	end
	describe "POST update" do
		before { current_user.create_profile }
		it_behaves_like "when user is not authenticated" do
			let(:action) { post :update, id: "not_a_real_id" }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { post :update, id: "not_a_real_id" }
		end
		it "sets profile variable" do
			post :update, id: current_user.id, profile: Fabricate.attributes_for(:profile, photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/support/images/test.jpg', 'image/jpg')),  contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
			expect(assigns(:profile)).to eq current_user.profile
		end
		context "when inputs are valid and a photo is present" do
			it "updates profile" do
				profile_attributes = Fabricate.attributes_for(:profile)
				post :update, id: current_user.id, profile:  Fabricate.attributes_for(:profile, photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/support/images/test.jpg', 'image/jpg')) ,  contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
				profile_attributes.each do |k,v|
					expect(assigns(:profile)[k]).to eq v
				end
			end
			it "renders crop" do
				post :update, id: current_user.id, profile:  Fabricate.attributes_for(:profile, photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/support/images/test.jpg', 'image/jpg')) ,  contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
				expect(response).to render_template :crop
			end
		end
		context "when inputs are valid and a photo is not present" do	
			it "updates profile" do
				profile_attributes = Fabricate.attributes_for(:profile)				
				post :update, id: current_user.id, profile:  Fabricate.attributes_for(:profile, photo: nil) ,contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
				profile_attributes.each do |k,v|
					expect(assigns(:profile)[k]).to eq v
				end
			end
			it "calls method reprocess photo" do
				Profile.any_instance.should_receive(:reprocess_photo)
				post :update, id: current_user.id, profile:  Fabricate.attributes_for(:profile, photo: nil) ,contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
			end
			it "redirects to profile edit" do
				post :update, id: current_user.id, profile:  Fabricate.attributes_for(:profile, photo: nil) ,contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
				expect(response).to redirect_to edit_profile_path
			end
			it "displays flash notice" do
			post :update, id: current_user.id, profile:  Fabricate.attributes_for(:profile, photo: nil) ,contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
				expect(flash[:notice]).to eq "Your profile has been succesfully updated."
			end
		end
		context "when inputs are invalid" do
			it "renders edit" do
				post :update, id: current_user.id, profile: Fabricate.attributes_for(:profile, photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/support/images/test.jpg', 'sound/mp3')),  contact: Fabricate.attributes_for(:contact), employment: Fabricate.attributes_for(:employment) 
				expect(response).to render_template :edit
			end
		end
	end
end
