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
            it "creates a user" do
                post :create, user: Fabricate.attributes_for(:user)
                expect(User.count).to eq 1
            end
            
            it "calls method sign_up on SignUp" do
				SignUp.any_instance.should_receive(:sign_up)
                post :create, user: Fabricate.attributes_for(:user)
            end 
            it "redirects to /" do
               post :create, user: Fabricate.attributes_for(:user)
                expect(response).to redirect_to root_path
            end
            it "displays a flash notice" do
                post :create, user: Fabricate.attributes_for(:user)
                expect(flash[:notice]).to eq "Thanks for signing up! Now sign in with your credentials."
            end
        end
        context "when user field are invalid" do
            it "doesn't call method signup service on SignUp" do
                SignUp.any_instance.should_not_receive(:sign_up)
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