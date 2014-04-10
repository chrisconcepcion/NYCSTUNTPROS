require 'spec_helper'

describe Profile do
    it { should belong_to(:user) }
    it { should have_one(:wardrobe) }
    it { should validate_presence_of(:user_id) }
    it { should have_one(:contact) }
    it { should have_one(:employment) }
    
end