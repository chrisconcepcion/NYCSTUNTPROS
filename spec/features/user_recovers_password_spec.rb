require 'spec_helper'

feature 'User Recovers Password' do
    given(:user) { Fabricate(:user) }
		given(:slow_user) { Fabricate(:user, reset_password_token: "oldToken", reset_password_sent_at: 3.hours.ago) }
		background do
			clear_emails
  	end
    scenario 'User forgot password and wants to login' do
        visit login_path
        click_button"Forgot Password?"
        expect(page).to have_content("Enter Email to Reset Password")
        fill_in "Email", with: user.email
        click_button "Submit"
				open_email(user.email)
    		current_email.should have_content "localhost:3000/update_password/"+"#{user.reload.reset_password_token}"
        visit update_password_path(user.reload.reset_password_token)
				fill_in :password, with: "newPass"
				fill_in "Password Confirmation", with: "newPass"
				click_button "Update Password"
				expect(page).to have_content "Your password have been updated. Log in with your new password."
				click_link "Login"
				fill_in "Email", with: user.email
				fill_in "Password", with: "newPass"
				fill_in "Password", with: "newPass"
				click_button "Login"
				expect(page).to have_content "You have successfully logged in!"
    end
		scenario "User started reset password process, got email with update_password url and waited longer than 2 hours to update their password" do
        visit update_password_path(slow_user.reload.reset_password_token)
				expect(page).to have_content "Reset password token has expired. Please go request to reset your password again and complete the process within 2 hours."
    end
	scenario 'User forgot password and enters invalid password on the password update page' do
        visit login_path
        click_button"Forgot Password?"
        expect(page).to have_content("Enter Email to Reset Password")
        fill_in "Email", with: user.email
        click_button "Submit"
				open_email(user.email)
    		current_email.should have_content "localhost:3000/update_password/"+"#{user.reload.reset_password_token}"
        visit update_password_path(user.reload.reset_password_token)
				fill_in :password, with: "fail"
				fill_in "Password Confirmation", with: "fail"
				click_button "Update Password"
				expect(page).to have_content "Password and Password Confirmation must match and be 6 characters or longer."
    end
end