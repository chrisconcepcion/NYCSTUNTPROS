require 'spec_helper'

feature 'User Recovers Password' do
    given(:user) { Fabricate(:user) }
    scenario 'User forgot password and wants to login' do
        visit login_path
        click_button"Forgot Password?"
        expect(page).to have_content("Enter Email to Reset Password")
        fill_in "Email", with: user.email
        click_button "Submit"
    
        
    end
end