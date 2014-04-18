require 'spec_helper'

describe ResetPasswordController do
	describe "GET new" do
		it_behaves_like "when user is authenticated" do
			let(:action) { get :new }
		end
	end
  describe "POST create" do
		it_behaves_like "when user is authenticated" do
			let(:action) { post :create }
		end
		
    context "when email matches a user" do
      let(:user) { Fabricate(:user) }
      
      it "calls password_reset on PasswordReset" do
        ResetPassword.any_instance.should_receive(:reset_password)
        post :create, email: user.email

      end
      it "redirects to root path" do
        post :create, email: user.email
        expect(response).to redirect_to reset_password_confirmation_path
      end
    end
    context "when email doesn't match a user" do
      it "redirects to new" do
        post :create, email: "invalid_email"
        expect(response).to redirect_to reset_password_path
    end
      it "displays a flash error" do
          post :create, email: "invalid_email"
        expect(flash[:error]).to eq "Invalid Email Address."
      end
    end
  end
end