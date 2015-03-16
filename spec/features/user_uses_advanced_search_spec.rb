require 'spec_helper'

feature 'User Uses Advanced Search' do
	given(:user) { Fabricate(:user) }
	
	background do
		user.create_profile
		user_sign_in(user)
	end
	
	scenario "logged user searches for a male user by the name of Jack London", js: true do
		stunt_actor1 = Fabricate(:male_stunt_actor)
		stunt_actor1.create_profile
		stunt_actor2 = Fabricate(:male_stunt_actor, first_name: "Jack", last_name: "London")
		stunt_actor2.create_profile
		stunt_actor2.profile.update!(physique: "athletic", ethnicity: "asian", hair_color: "black", hair_length: "short", eye_color: "blue")
		stunt_actor3 = Fabricate(:male_stunt_actor)
		stunt_actor3.create_profile
		stunt_actor4 = Fabricate(:male_stunt_actor)
		stunt_actor4.create_profile
		stunt_actor5 = Fabricate(:male_stunt_actor)
		stunt_actor5.create_profile
		visit advanced_search_male_stunt_actor_index_path
		fill_in "First Name", with: "Jack"
		fill_in "Last Name", with: "London"
		select "Athletic", from: "Physique"
		select "Asian", from: "Ethnicity"
		select "Black", from: "Hair Color"
		select "Short", from: "Hair Length"
		select "Blue", from: "Eye Color"
		click_button "Search"
		expect(page).to have_content "Jack London"
		expect(page).to have_css(".profile", :count => 1)
	end
	
	scenario "logged user searches for a female user by the name of Veronica Maggio", js: true do
		stunt_actor1 = Fabricate(:female_stunt_actor)
		stunt_actor1.create_profile
		stunt_actor2 = Fabricate(:female_stunt_actor, first_name: "Veronica", last_name: "Maggio")
		stunt_actor2.create_profile
		stunt_actor2.profile.update!(physique: "athletic", ethnicity: "caucasian", hair_color: "blond", hair_length: "long", eye_color: "blue")
		stunt_actor3 = Fabricate(:female_stunt_actor)
		stunt_actor3.create_profile
		stunt_actor4 = Fabricate(:female_stunt_actor)
		stunt_actor4.create_profile
		stunt_actor5 = Fabricate(:female_stunt_actor)
		stunt_actor5.create_profile
		visit advanced_search_female_stunt_actor_index_path
		fill_in "First Name", with: "Veronica"
		fill_in "Last Name", with: "Maggio"
		select "Athletic", from: "Physique"
		select "Caucasian", from: "Ethnicity"
		select "Blond", from: "Hair Color"
		select "Long", from: "Hair Length"
		select "Blue", from: "Eye Color"
		click_button "Search"
		expect(page).to have_content "Veronica Maggio"
		expect(page).to have_css(".profile", :count => 1)
	end
end