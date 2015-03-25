require 'spec_helper'
require 'spec_helper'

describe User do
	it { should validate_presence_of(:email) } 
	it { should validate_uniqueness_of(:email) } 
	it { should ensure_length_of(:password).is_at_least(6) }
  it { should ensure_inclusion_of(:gender).in_array(%w[male female]) }
  it { should ensure_inclusion_of(:roles).in_array(%w[actor coordinator both]) }
  it { should have_one(:profile) }
  describe "#create_profile" do
    let(:user) { Fabricate(:user) }
    before { user.create_profile }
    it "creates a profile associated with a user" do
      expect(user.profile).to_not eq nil
    end
    it "creates a contact associated with a profile associated to a user" do
      expect(user.profile.contact).to_not eq nil
    end
    it "creates employment associated with a profile associated to a user" do
      expect(user.profile.employment).to_not eq nil
    end
  end
	describe "#populate_full_name" do
	  context "before save" do
		  it "assigns full name" do
			  user = User.create( Fabricate.attributes_for(:user, first_name:"chris", middle_name:"nope", last_name:"concepcion") )
        expect(user.reload.full_name).to eq "chris nope concepcion"
			end
	  end
	end
  describe "#generate_token" do
	  describe "before save" do
		  it "creates a auth token on create" do
			  user = User.create( Fabricate.attributes_for(:user) )
        expect(user.generate_token(:auth_token)).to_not eq nil
      end
	  end
	  it "creates a random token for a column" do
		  user = Fabricate(:user, reset_password_token: nil)
      expect(user.generate_token(:reset_password_token)).to_not eq nil
    end
	  it "doesn't save" do
	    user = Fabricate(:user, reset_password_token: nil)
		  user.generate_token(:reset_password_token)
			expect(user.reset_password_token_changed?).to eq true
		end
  end
  describe ".stunt_coordinators" do
	  it "returns all users that have the role coordinator" do
		  coordinator1 = Fabricate(:stunt_coordinator)
		  coordinator2 = Fabricate(:stunt_coordinator)
			coordinator3 = Fabricate(:stunt_coordinator)
			actor1 = Fabricate(:stunt_actor)
			actor2 = Fabricate(:stunt_actor)
			expect(User.stunt_coordinators).to match_array [coordinator1, coordinator2, coordinator3]
		end
		it "returns all users that have the role both" do
		  stunt_master1 = Fabricate(:stunt_master)
		  stunt_master2 = Fabricate(:stunt_master)
			stunt_master3 = Fabricate(:stunt_master)
			actor1 = Fabricate(:stunt_actor)
			actor2 = Fabricate(:stunt_actor)
			expect(User.stunt_coordinators).to match_array [stunt_master1, stunt_master2, stunt_master3]
		end
		it "returns all users that have the role both and coordinator" do
		  stunt_master1 = Fabricate(:stunt_master)
		  stunt_master2 = Fabricate(:stunt_master)
			stunt_master3 = Fabricate(:stunt_master)
			coordinator1 = Fabricate(:stunt_coordinator)
		  coordinator2 = Fabricate(:stunt_coordinator)
			coordinator3 = Fabricate(:stunt_coordinator)
			actor1 = Fabricate(:stunt_actor)
			actor2 = Fabricate(:stunt_actor)
			expect(User.stunt_coordinators).to match_array [stunt_master1, stunt_master2, stunt_master3, coordinator1, coordinator2, coordinator3]
		end
	end
	describe ".stunt_actors" do
		context "with valid input" do
			context "with male as gender" do
	  		it "returns all users that have the role coordinator" do
					male_stunt_actor1 = Fabricate(:male_stunt_actor)
					male_stunt_actor2 = Fabricate(:male_stunt_actor)
					male_stunt_actor3 = Fabricate(:male_stunt_actor)
					male_stunt_actor4 = Fabricate(:male_stunt_actor)
					male_stunt_actor5 = Fabricate(:male_stunt_actor)
					male_stunt_actor6 = Fabricate(:male_stunt_actor)
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					expect(User.stunt_actors("male")).to match_array [male_stunt_actor6, male_stunt_actor5, male_stunt_actor4, male_stunt_actor3, male_stunt_actor2, male_stunt_actor1]
				end
				it "returns all users that have the role both" do
					male_stunt_master1 = Fabricate(:male_stunt_master)
		  		male_stunt_master2 = Fabricate(:male_stunt_master)
					male_stunt_master3 = Fabricate(:male_stunt_master)
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					expect(User.stunt_actors("male")).to match_array [ male_stunt_master1, male_stunt_master2, male_stunt_master3]
				end
			end
			it "returns all users that have the role coordinator and both" do
					male_stunt_actor1 = Fabricate(:male_stunt_actor)
					male_stunt_actor2 = Fabricate(:male_stunt_actor)
					male_stunt_actor3 = Fabricate(:male_stunt_actor)
					male_stunt_actor4 = Fabricate(:male_stunt_actor)
					male_stunt_actor5 = Fabricate(:male_stunt_actor)
					male_stunt_actor6 = Fabricate(:male_stunt_actor)
					male_stunt_master1 = Fabricate(:male_stunt_master)
		  		male_stunt_master2 = Fabricate(:male_stunt_master)
					male_stunt_master3 = Fabricate(:male_stunt_master)
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					expect(User.stunt_actors("male")).to match_array [male_stunt_actor6, male_stunt_actor5, male_stunt_actor4, male_stunt_actor3, male_stunt_actor2, male_stunt_actor1, male_stunt_master1, male_stunt_master2, male_stunt_master3]
				end
			context "with female as gender" do
				it "returns all female stunt actors" do
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					female_stunt_actor3 = Fabricate(:female_stunt_actor)
					female_stunt_actor4 = Fabricate(:female_stunt_actor)
					female_stunt_actor5 = Fabricate(:female_stunt_actor)
					female_stunt_actor6 = Fabricate(:female_stunt_actor)
					male_stunt_actor1 = Fabricate(:male_stunt_actor)
					male_stunt_actor2 = Fabricate(:male_stunt_actor)
					male_stunt_actor3 = Fabricate(:male_stunt_actor)
					expect(User.stunt_actors("female")).to match_array [female_stunt_actor6, female_stunt_actor5, female_stunt_actor4, female_stunt_actor3, female_stunt_actor2, female_stunt_actor1]
				end
				it "returns all users that have the role both" do
					female_stunt_master1 = Fabricate(:female_stunt_master)
		  		female_stunt_master2 = Fabricate(:female_stunt_master)
					female_stunt_master3 = Fabricate(:female_stunt_master)
					male_stunt_master1 = Fabricate(:male_stunt_master)
		  		male_stunt_master2 = Fabricate(:male_stunt_master)
					male_stunt_master3 = Fabricate(:male_stunt_master)
					male_stunt_actor1 = Fabricate(:male_stunt_actor)
					male_stunt_actor2 = Fabricate(:male_stunt_actor)
					expect(User.stunt_actors("female")).to match_array [ female_stunt_master1, female_stunt_master2, female_stunt_master3]
				end
				it "returns all users that have the role both" do
					female_stunt_master1 = Fabricate(:female_stunt_master)
		  		female_stunt_master2 = Fabricate(:female_stunt_master)
					female_stunt_master3 = Fabricate(:female_stunt_master)
					male_stunt_master1 = Fabricate(:male_stunt_master)
		  		male_stunt_master2 = Fabricate(:male_stunt_master)
					male_stunt_master3 = Fabricate(:male_stunt_master)
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					expect(User.stunt_actors("female")).to match_array [ female_stunt_master1, female_stunt_master2, female_stunt_master3, female_stunt_actor1, female_stunt_actor2]
				end
			end
		end
		context "with invalid input" do
			it "returns an empty array" do
				male_stunt_actor1 = Fabricate(:male_stunt_actor)
				male_stunt_actor2 = Fabricate(:male_stunt_actor)
				male_stunt_actor3 = Fabricate(:male_stunt_actor)
				male_stunt_actor4 = Fabricate(:male_stunt_actor)
				male_stunt_actor5 = Fabricate(:male_stunt_actor)
				male_stunt_actor6 = Fabricate(:male_stunt_actor)
				female_stunt_actor1 = Fabricate(:female_stunt_actor)
				female_stunt_actor2 = Fabricate(:female_stunt_actor)
				female_stunt_actor3 = Fabricate(:female_stunt_actor)
				female_stunt_actor4 = Fabricate(:female_stunt_actor)
				female_stunt_actor5 = Fabricate(:female_stunt_actor)
				female_stunt_actor6 = Fabricate(:female_stunt_actor)
				expect(User.stunt_actors("fail")).to match_array []
			end
		end
	end
	describe ".stunt_actors_recent_4" do
	  context "with valid input" do
		  context "with male as gender" do
			  it "returns the 4 most recent created male users with roles actor and both" do
					male_stunt_actor1 = Fabricate(:male_stunt_actor)
				  male_stunt_actor2 = Fabricate(:male_stunt_actor)
					male_stunt_actor3 = Fabricate(:male_stunt_actor)
					male_stunt_actor4 = Fabricate(:male_stunt_actor)
					male_stunt_actor5 = Fabricate(:male_stunt_actor)
					male_stunt_actor6 = Fabricate(:male_stunt_actor)
					male_stunt_master1 = Fabricate(:male_stunt_master)
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					female_stunt_actor3 = Fabricate(:female_stunt_actor)
					female_stunt_master1 = Fabricate(:female_stunt_master)
					expect(User.stunt_actors_recent_4("male")).to eq [male_stunt_master1, male_stunt_actor6, male_stunt_actor5, male_stunt_actor4]
				end
			  context "with female as gender" do
				  it "returns the 4 most recent created female users with roles actor or both" do
					  male_stunt_actor1 = Fabricate(:male_stunt_actor)
				  male_stunt_actor2 = Fabricate(:male_stunt_actor)
					male_stunt_actor3 = Fabricate(:male_stunt_actor)
					male_stunt_actor4 = Fabricate(:male_stunt_actor)
					male_stunt_actor5 = Fabricate(:male_stunt_actor)
					male_stunt_actor6 = Fabricate(:male_stunt_actor)
					male_stunt_master1 = Fabricate(:male_stunt_master)
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					female_stunt_actor3 = Fabricate(:female_stunt_actor)
					female_stunt_master1 = Fabricate(:female_stunt_master)
						expect(User.stunt_actors_recent_4("female")).to eq [female_stunt_master1, female_stunt_actor3, female_stunt_actor2, female_stunt_actor1]
					end
				end
			end
			context "with invalid input" do
				it "returns empty array" do
					female_stunt_actor1 = Fabricate(:female_stunt_actor)
					female_stunt_actor2 = Fabricate(:female_stunt_actor)
					female_stunt_actor3 = Fabricate(:female_stunt_actor)
					female_stunt_actor4 = Fabricate(:female_stunt_actor)
					female_stunt_actor5 = Fabricate(:female_stunt_actor)
					female_stunt_actor6 = Fabricate(:female_stunt_actor)
					male_stunt_actor1 = Fabricate(:male_stunt_actor)
					male_stunt_actor2 = Fabricate(:male_stunt_actor)
					male_stunt_actor3 = Fabricate(:male_stunt_actor)
					expect(User.stunt_actors_recent_4("rofl")).to eq []
				end
			end
		end
	end
	describe ".stunt_coordinator_recent_4" do
		it "returns the 4 most recent created of a collection" do
			coordinator1 = Fabricate(:stunt_coordinator)
			coordinator2 = Fabricate(:stunt_coordinator)
			coordinator3 = Fabricate(:stunt_coordinator)
			coordinator4 = Fabricate(:stunt_coordinator)
			coordinator5 = Fabricate(:stunt_coordinator)
			coordinator6 = Fabricate(:stunt_coordinator)
			coordinator7 = Fabricate(:stunt_coordinator)
			coordinator8 = Fabricate(:stunt_coordinator)
			coordinator9 = Fabricate(:stunt_coordinator)
			male_stunt_master1 = Fabricate(:male_stunt_master)
			female_stunt_actor1 = Fabricate(:female_stunt_actor)
			female_stunt_actor2 = Fabricate(:female_stunt_actor)
			female_stunt_actor3 = Fabricate(:female_stunt_actor)
			female_stunt_master1 = Fabricate(:female_stunt_master)
			
			expect(User.stunt_coordinators_recent_4).to eq [female_stunt_master1, male_stunt_master1, coordinator9, coordinator8]
		end
	end
	describe "#search_actors_by_full_name" do
		context "with invalid inputs" do
			it "when keyword is blank returns blank array " do
				user = Fabricate(:user)
				expect(User.search_actors_by_full_name("", "female")).to eq []
			end
			it "when gender is blank returns blank array " do
				user1 = Fabricate(:male_stunt_actor, last_name: 'Batman 1')
				user2 = Fabricate(:male_stunt_actor, first_name: 'Batman 2' )
				user3 = Fabricate(:female_stunt_actor, first_name: 'Monk')
				user4 = Fabricate(:female_stunt_actor, middle_name: 'South Park')
				expect(User.search_actors_by_full_name('Monk', '')).to eq []
			end
			it "when gender is not female or male returns blank array " do
				user1 = Fabricate(:male_stunt_actor, last_name: 'Batman 1')
				user2 = Fabricate(:male_stunt_actor, first_name: 'Batman 2' )
				user3 = Fabricate(:female_stunt_actor, first_name: 'Monk')
				user4 = Fabricate(:female_stunt_actor, middle_name: 'South Park')
				expect(User.search_actors_by_full_name('Monk', 'not_gender')).to eq []
			end
		end
		it "returns a blank array when no name match the keyword" do
			user1 = Fabricate(:male_stunt_actor, last_name: 'Batman 1')
			user2 = Fabricate(:male_stunt_actor, first_name: 'Batman 2' )
			user3 = Fabricate(:female_stunt_actor, first_name: 'Monk')
			user4 = Fabricate(:female_stunt_actor, middle_name: 'South Park')
			expect(User.search_actors_by_full_name('George', 'female')).to eq []
		end
		it "returns array of users when names matches the keyword" do
			user1 = Fabricate(:male_stunt_actor, last_name: 'Batman 1')
			user2 = Fabricate(:male_stunt_actor, first_name: 'Batman 2' )
			user3 = Fabricate(:female_stunt_actor, first_name: 'Monk')
			user4 = Fabricate(:female_stunt_actor, middle_name: 'South Park')
			expect(User.search_actors_by_full_name("batman", "male")).to eq [user2, user1]
		end
		it "returns array of users when names matches the keyword" do
			user1 = Fabricate(:male_stunt_actor, last_name: 'Batman 1')
			user2 = Fabricate(:male_stunt_actor, first_name: 'Batman 2' )
			user3 = Fabricate(:female_stunt_actor, first_name: 'Monk')
			user4 = Fabricate(:female_stunt_actor, middle_name: 'South Park')
			expect(User.search_actors_by_full_name("Batman", "male")).to eq [user2, user1]
		end
	end
	describe "update_password" do
		let(:user) { Fabricate(:user, password: "old_password") }
		context "with valid inputs" do
			it "updates user password" do
				user.update_password("new_password", "new_password")
				expect(user.reload.authenticate("new_password")).to be_true
			end
			it "returns false" do
				expect(user.update_password("new_password", "new_password")).to eq true
			end
		end
		context" with invalid inputs" do
			it "returns false" do
				expect(user.update_password("wrong_password", "incorrect_password")).to eq false
			end
		end
	end
end