require 'spec_helper'

describe UpdateUser do
	context "#update_user" do
		context "with valid user inputs and valid password and password confirmation inputs" do
			let(:user) { Fabricate(:user) }
			let(:user_params) do 
				{ first_name: "name1", middle_name: "name2", last_name: "name3", email:"changedemail@example.com", password: "newPass", password_confirmation: "newPass", roles: "both", gender: "male" }
			end
			it "updates user" do
				update = UpdateUser.new(user, user_params).update_user
				expect(user.reload.email).to eq "changedemail@example.com"
				expect(user.reload.first_name).to eq "name1"
				expect(user.reload.middle_name).to eq "name2"
				expect(user.reload.last_name).to eq "name3"
				expect(user.reload.roles).to eq "both"
				expect(user.reload.authenticate("newPass")).to be_true
			end
			it "#successful? returning true" do
				update = UpdateUser.new(user, user_params).update_user
				expect(update.successful?).to eq true
			end
		end
		context "with valid user inputs and blank password and password confirmation inputs" do
			let(:user) { Fabricate(:user) }
			let(:user_params) do 
				{ first_name: "name1", middle_name: "name2", last_name: "name3", email:"changedemail@example.com", password: "", password_confirmation: "", roles: "both", gender: "male" }
			end
			it "updates user" do
				update = UpdateUser.new(user, user_params).update_user
				expect(user.reload.email).to eq "changedemail@example.com"
				expect(user.reload.first_name).to eq "name1"
				expect(user.reload.middle_name).to eq "name2"
				expect(user.reload.last_name).to eq "name3"
				expect(user.reload.roles).to eq "both"
			end
			it "results in #successful? returning true" do
				update = UpdateUser.new(user, user_params).update_user
				expect(update.successful?).to eq true
			end
		end
		context "with invalid input" do
			context "with valid user inputs and blank password and password confirmation inputs" do
			let(:user) { Fabricate(:user) }
			let(:user_params) do 
				{ first_name: "name1", middle_name: "name2", last_name: "name3", email:"changedemail@example.com", password: "not_matching_pass", password_confirmation: "bad_pass", roles: "both", gender: "male" }
			end
			it "updates user" do
				update = UpdateUser.new(user, user_params).update_user
				expect(user.reload.email).to_not eq "changedemail@example.com"
				expect(user.reload.first_name).to_not eq "name1"
				expect(user.reload.middle_name).to_not eq "name2"
				expect(user.reload.last_name).to_not eq "name3"
				expect(user.reload.roles).to_not eq "both"
			end
			it "results in #successful? returning false" do
				update = UpdateUser.new(user, user_params).update_user
				expect(update.successful?).to eq false
			end
			it "results in #error_message returning false" do
				update = UpdateUser.new(user, user_params).update_user
				expect(update.error_message).to eq "Please check the form for errors."
			end
		end
		end
	end
end