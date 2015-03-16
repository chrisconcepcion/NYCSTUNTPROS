require 'spec_helper'

describe UpdatePasswordController do
  describe "GET new" do
		it_behaves_like "when user is authenticated" do
			let(:action) { get :new, reset_password_token: "testing" }
		end
		it_behaves_like "when reset_password_token is invalid" do
			let(:action) { get :new, reset_password_token:"" }
    end
  	context "when reset_password_token matches a user" do
      it "sets user variable" do
	    	user = Fabricate(:user, reset_password_token: "workingToken", reset_password_sent_at: 1.hour.ago) 
 				get :new, reset_password_token: "workingToken"
				expect(assigns(:user)).to eq user
	  	end	
    end
	end
	
  describe "POST create" do
		let(:user_with_old_reset_password_token) { Fabricate(:user, reset_password_token:"oldToken", reset_password_sent_at: 3.hours.ago) }
		it_behaves_like "when user is authenticated" do
			let(:action) { post :create, reset_password_token: "testing" }
		end
		it_behaves_like "when reset_password_token is invalid" do
			let(:action) { post :create, reset_password_token: "testing" }
    end
		
		it_behaves_like "when reset_password_sent_at is older than 2 hours" do
			let(:action) { post :create, reset_password_token: user_with_old_reset_password_token.reset_password_token }
		end
		context "when password and password confirmation match and are 6 characters or longer" do
			let(:user) { Fabricate(:user, reset_password_sent_at: 1.hours.ago, reset_password_token: "workingToken") }
      it "updates the users password" do		  		
				post :create, reset_password_token: user.reset_password_token, password: "newPa$$", password_confirmation: "newPa$$"
	  		expect(user.reload.authenticate("newPa$$")).to be_true
	 		end
			it "updates sets user reset_password_token to nil" do		  		
				post :create, reset_password_token: user.reset_password_token, password: "newPa$$", password_confirmation: "newPa$$"
	  		expect(user.reload.reset_password_token).to be_nil
	 		end
     	it "redirects to root path" do
		 		post :create, reset_password_token: user.reset_password_token, password: "newPa$$", password_confirmation: "newPa$$"
		  	expect(response).to redirect_to root_path
			end
	    it "displays a flash notice" do
				post :create, reset_password_token: user.reset_password_token,  password: "newPa$$", password_confirmation: "newPa$$"
  			expect(flash[:notice]).to eq "Your password have been updated. Log in with your new password."
			end
    end
		context "when password and password confirmation don't match or is less than 6 characters" do
			it "renders new template" do
				user = Fabricate(:user, reset_password_sent_at: 1.hours.ago, reset_password_token: "workingToken")
				post :create, reset_password_token: user.reset_password_token,  password: "newpa$$", password_confirmation: "roflcopter"
				expect(response).to redirect_to update_password_path("workingToken")
			end
			it "displays a flash error" do
				user = Fabricate(:user, reset_password_sent_at: 1.hours.ago, reset_password_token: "workingToken")
				post :create, reset_password_token: user.reset_password_token,  password: "newpa$$", password_confirmation: "roflcopter"
				expect(flash[:error]).to eq "Password and Password Confirmation must match and be 6 characters or longer."
			end
		end
	end
end