require 'spec_helper'

feature "User Registers with user information and credit card", js: true do
	background do
		visit register_path
	end

	scenario "Vistor submits valid input for user form and valid credit card" do
		fill_in "Email", with: 'testing123@example.com'
		fill_in 'Password', with: 'testingpassword'
		fill_in 'First Name', with: 'Tester'
		fill_in 'Last Name', with: 'McTesterson'
		fill_in 'Full Name', with: 'Tester McTesterson'
		fill_in 'Credit Card Number', with: '4242424242424242'
		fill_in 'CVV Code', with: '123'
		select(12, :from => "date_month")
		select(2017, :from => "date_year")
		click_button "Sign Up"
	end
end