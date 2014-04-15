require 'spec_helper'

describe UpdatePasswordController do
  describe "GET new" do
  	context "when reset_password_token matches a user" do
      it "sets user variable" do
	    user = Fabricate(:user, reset_password_token: "workingToken") 
 		get :new, id: "workingToken"
		expect(assigns(:user)).to eq user
	  end	
    end
    context "when reset_password_token doesn't match a user" do
      it "redirects to invalid token page" do
 		get :new, id:""
		expect(response).to redirect_to invalid_token_path
	  end
    end
  end
  describe "POST create" do
		context "when password and password confirmation match" do
				context "when new password is valid" do
					context "when reset password email was sent less than 2 hours ago" do
						let(:user) { Fabricate(:user, reset_password_sent_at: 1.hours.ago, reset_password_token: "workingToken") }
      			it "updates the users password" do
		  				post :create, reset_password_token: user.reset_password_token, password: "newPa$$", password_confirmation: "newPa$$"
		  				expect(user.reload.authenticate("newPa$$")).to be_true
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
					context "when reset password email was sent over 2 hours ago" do
						let(:user) { Fabricate(:user, reset_password_sent_at: 3.hours.ago, reset_password_token: "workingToken") }
						it "redirects to reset password page" do
							post :create, reset_password_token: user.reset_password_token,  password: "newPa$$", password_confirmation: "newPa$$"
							expect(response).to redirect_to reset_password_path
						end
						it "displays a flash error" do
							post :create, reset_password_token: user.reset_password_token,  password: "newPa$$", password_confirmation: "newPa$$"
							expect(flash[:error]).to eq "Reset password token has expired."
						end
					end
				end
    		context "when new password is invalid" do
    			it "redirects to new page" do
						user = Fabricate(:user, reset_password_sent_at: 1.hours.ago, reset_password_token: "workingToken")
						post :create, reset_password_token: user.reset_password_token,  password: "rofl", password_confirmation: "rofl"
						expect(response).to render_template :new
					end
    		end
  		end
		end
		context "when password and password confirmation don't match" do
			it "renders new template" do
				user = Fabricate(:user, reset_password_sent_at: 1.hours.ago, reset_password_token: "workingToken")
				post :create, reset_password_token: user.reset_password_token,  password: "newpa$$", password_confirmation: "roflcopter"
				expect(response).to render_template :new
			end
			it "displays a flash error" do
				user = Fabricate(:user, reset_password_sent_at: 1.hours.ago, reset_password_token: "workingToken")
				post :create, reset_password_token: user.reset_password_token,  password: "newpa$$", password_confirmation: "roflcopter"
				expect(flash[:error]).to eq "Password and Password Confirmation must match."
			end
		end
	end
