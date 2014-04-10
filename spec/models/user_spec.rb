require 'spec_helper'

describe User do
	it { should validate_presence_of(:email) } 
	it { should validate_uniqueness_of(:email) } 
	it { should ensure_length_of(:password).is_at_least(6) }
    it { should ensure_inclusion_of(:gender).in_array(%w[male female]) }
    it { should ensure_inclusion_of(:roles).in_array(%w[actor coordinator]) }
    it { should have_one(:profile) }
    
    describe "#create_profile" do
        let(:user) { Fabricate(:user) }
        before { user.create_profile }
        
        it "creates a profile associated with a user" do
            expect(user.profile).to_not eq nil
        end
        it "creates a wardrobe associated with a profile associated to a user" do
            expect(user.profile.wardrobe).to_not eq nil
        end
        it "creates a contact associated with a profile associated to a user" do
            expect(user.profile.contact).to_not eq nil
        end
        it "creates employment associated with a profile associated to a user" do
            expect(user.profile.employment).to_not eq nil
        end
    end
end