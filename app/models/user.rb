class User < ActiveRecord::Base
	has_secure_password validations: false
    has_one :profile

	validates :password, length: { minimum: 6 }
	validates :email, uniqueness: true, presence: true
    validates :gender, :inclusion => %w(male female)
    validates :roles, :inclusion => %w(actor coordinator)
    
    def create_profile
        self.create_profile!
        user_profile = self.profile
        user_profile.create_wardrobe!
        user_profile.create_contact!
        user_profile.create_employment!
    end
end
