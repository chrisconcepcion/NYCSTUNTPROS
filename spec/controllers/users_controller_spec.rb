require 'spec_helper'

describe UsersController do
	describe "GET new" do
		it "sets user variable" do
			get :new
			expect(assigns(:user)).to be_new_record
			expect(assigns(:user)).to be_instance_of(User)
		end
	end
    describe "POST create" do
        context "when user fields are valid" do
            it "calls method create_profile" do
                expect_any_instance_of(User).to receive(:create_profile)
                post :create, user: Fabricate.attributes_for(:user)
            end
            it "redirects to /" do
               post :create, user: Fabricate.attributes_for(:user)
                expect(response).to redirect_to "/"
            end
            
            it "sends a welcome email"
                
                
            it "displays a flash notice" do
                post :create, user: Fabricate.attributes_for(:user)
                expect(flash[:notice]).to eq "Thanks for signing up! Now sign in with your credentials."
            end
            
        end
        context "when user field are invalid" do
            it "doesn't call method create_profile" do
                expect_any_instance_of(User).to_not receive(:create_profile)
                post :create, user: Fabricate.attributes_for(:invalid_user)
            end
            
            it "doesn't create a user" do
                post :create, user: Fabricate.attributes_for(:invalid_user)
                expect(User.count).to eq 0
            end
            it "renders new" do
                post :create, user: Fabricate.attributes_for(:invalid_user)
                expect(response).to render_template :new
            end
        end
    end
end