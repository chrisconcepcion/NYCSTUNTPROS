require 'spec_helper'

feature 'User updates profile' do
		given(:user) { Fabricate(:user) }
		
		background do
			user.create_profile
			user_sign_in(user)
		end
			
    scenario "logged in user updates his profile information",:js => true do
    	visit edit_profile_path(user.id)
			wait_for_ajax
			select "72", :from => "height"
			select "Asian", :from => "ethnicity"
			select "Blue", :from => "eye_color"
			select "Brown", :from => "hair_color"
			select "Short", :from => "hair_length"
			select "180", :from => "weight"
			select "Average", :from => "physique"
			fill_in "shirt_neck", :with => "30 inches"
			fill_in "shirt_sleeve", :with =>  "22" 
			fill_in "suit_dress_size", :with => "Large"
			fill_in "pants_inseam", :with =>  "35"
			fill_in "pants_waist", :with =>  "28"
			fill_in  "shoe_size", :with =>  "12"
			fill_in "hat_size", :with =>  "7"
			fill_in "glove_size", :with => "x-large"
			page.find('#updateProfile').find('button', :text => "Update").click
			wait_for_ajax
			expect{ user.reload }.to change{ [user.profile.height, user.profile.ethnicity, user.profile.eye_color, user.profile.hair_color, user.profile.hair_length, user.profile.shirt_neck, user.profile.shirt_sleeve, user.profile.suit_dress_size, user.profile.pants_inseam, user.profile.pants_waist, user.profile.shoe_size, user.profile.hat_size, user.profile.glove_size, user.profile.physique, user.profile.weight] }.from([nil, nil, nil,nil, nil, nil,nil, nil, nil,nil, nil, nil,nil,nil,nil]).to([72, "asian","blue","brown","short","30 inches","22","Large","35","28","12","7","x-large","average",180])
			 expect(page).to have_content "Your profile has been successfully updated!"
  	end
	
		scenario "logged in user updates his contact information",:js => true do
    	visit edit_profile_path(user.id)
			wait_for_ajax
			fill_in "address_line_1", :with => "255 sheridan dr"
			fill_in "address_line_2", :with =>  "apt. 9000" 
			fill_in "city", :with => "New School"
			fill_in "state", :with =>  "New Mexico"
			fill_in "zip_code", :with =>  "15120"
			fill_in "phone_number", :with =>  "999-999-9999"
			fill_in "website", :with =>  "www.coolbirds.com"
			page.find('#updateContact').find('button', :text => "Update").click
			wait_for_ajax
			expect{ user.reload }.to change{ [user.profile.contact.address_line_1, user.profile.contact.address_line_2, user.profile.contact.city, user.profile.contact.state, user.profile.contact.zip_code, user.profile.contact.phone_number, user.profile.contact.website] }.from([nil, nil, nil,nil, nil, nil,nil]).to(["255 sheridan dr", "apt. 9000", "New School", "New Mexico", "15120", "999-999-9999", "www.coolbirds.com"])
			 expect(page).to have_content "Your contact information has been successfully updated!"
  	end
	
		scenario "logged in user updates his employment information",:js => true do
    	visit edit_profile_path(user.id)
			wait_for_ajax
			fill_in "skills", :with => "karate, telepath, squirrel caller"
			fill_in "training", :with =>  "99 degrees" 
			fill_in "work_history", :with => "superhero"
			fill_in "job_categories", :with =>  "stunt actor manager"
			fill_in "past_job_titles", :with =>  "Chief of Staff"
			fill_in "primary_citizenship", :with =>  "United States"
			select "Yes", :from => "work_unpaid"
			select "Yes", :from => "united_states_citizenship"
			select "No", :from => "valid_passport"
			page.find('#updateEmployment').find('button', :text => "Update").click
			wait_for_ajax
			expect{ user.reload }.to change{ [user.profile.employment.skills, user.profile.employment.training, user.profile.employment.work_history, user.profile.employment.job_categories, user.profile.employment.past_job_titles, user.profile.employment.primary_citizenship, user.profile.employment.work_unpaid, user.profile.employment.united_states_citizenship, user.profile.employment.valid_passport] }.from([nil, nil, nil,nil, nil, nil, nil, nil, nil]).to(["karate, telepath, squirrel caller", "99 degrees", "superhero", "stunt actor manager", "Chief of Staff", "United States", true, true, false])
			 expect(page).to have_content "Your employment information has been successfully updated!"
  	end
	scenario "logged in user adds a new credit, edits the credit and then deletes it",:js => true do
		visit edit_profile_path(user.id)
		wait_for_ajax
		page.find('button', :text => "Add a new Credit").click
		select "Film", :from => "media_category"
		fill_in "project_name", :with => "Batman"
		fill_in "role", :with => "Lead Actor"
		fill_in "company", :with => "Warner Bros"
		select "1990", :from => "start_year"
		select "1992", :from => "end_year"
		page.find('#addCredit').find('button', :text => "ADD").click
		wait_for_ajax
		expect(page).to have_content "You have added a new credit."
		page.find('button', :text => "Edit").click
		page.find('.editCredit').select "Television", :from => "media_category"
		page.find('.editCredit').fill_in "project_name", :with => "House of Cards"
		page.find('.editCredit').fill_in "role", :with => "Main Actress"
		page.find('.editCredit').fill_in "company", :with => "Netflix"
		page.find('.editCredit').select "2013", :from => "start_year"
		page.find('.editCredit').select "2014", :from => "end_year"
		page.find('.editCredit').find('button', :text => "Update").click
		wait_for_ajax
		expect(page).to have_content "You have successfully updated your credit."
		page.find('.deleteCreditButton').click
		page.find('#myModal').find('button', :text => "Delete").click
		expect(page).to_not have_content "House of Cards"
	end
end