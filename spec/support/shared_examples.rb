shared_examples "when reset_password_token is invalid" do
	it "redirects to invalid_token page" do
		action
		expect(response).to redirect_to invalid_token_path
	end
end
 
shared_examples "when reset_password_sent_at is older than 2 hours" do
	it "redirects to reset_password page" do
		action
		expect(response).to redirect_to reset_password_path
	end
	it "displays a flash error" do
		action
		expect(flash[:error]).to eq "Reset password token has expired. Please go request to reset your password again and complete the process within 2 hours."
	end
end

shared_examples "when user is authenticated" do
	before { set_user_with_valid_reset_password_token }
	it "redirects to root page" do
		action
		expect(response).to redirect_to root_path
	end
end

shared_examples "when user is not authenticated" do
	before { cookies.delete(:auth_token) }
	it "displays a flash notice" do
		action
		expect(flash[:error]).to eq "Only authenticated users can preform this action, please sign in."
	end
	it "redirects to root page" do
		action
		expect(response).to redirect_to login_path
	end
end

shared_examples "when user is not owner" do
	before do 
		set_current_user
		current_user.create_profile
	end
	it "displays a flash error" do
		action
		expect(flash[:error]).to eq "You're not allowed to preform that action."
	end
	it "redirects to root" do
		action
		expect(response).to redirect_to root_path
	end
end