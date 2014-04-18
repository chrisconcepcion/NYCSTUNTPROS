require 'spec_helper'

feature 'User registers, logs in and logs out' do
		
    given (:user) { Fabricate(:user) } 
    scenario "User stumbles upon website and registers" do
        visit root_path
        click_link "Register"
        fill_in "Email", with: "coolstuntdude"
        fill_in "Password", with: "coolstunts"
        fill_in "First Name", with: "bob"
        fill_in "Last Name", with: "builder"
        choose('Male')
        choose('Stunt Actor')
        click_button "Sign Up"
        expect(page).to have_content "Thanks for signing up! Now sign in with your credentials."
    end
    
    scenario 'User has just registered and now will login and then log out' do
        visit root_path
        click_link "Login"
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Login"
        expect(page).to have_content "You have successfully logged in!"
        click_link "logout"
        expect(page).to have_content "You have successfully logged out."
    end
end