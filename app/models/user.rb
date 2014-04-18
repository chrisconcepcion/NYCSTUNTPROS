class User < ActiveRecord::Base
	has_secure_password validations: false
    has_one :profile
    has_one :stunt_profile

	validates :password, length: { minimum: 6 }
	validates :email, uniqueness: true, presence: true
    validates :gender, :inclusion => %w(male female)
    validates :roles, :inclusion => %w(actor coordinator)
    before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

    def create_profile
        self.create_profile!
        user_profile = self.profile
        user_profile.create_wardrobe!
        user_profile.create_contact!
        user_profile.create_employment!

        self.create_stunt_profile!

        #stunt_profile = self.create_stunt_profile(:validate => false)
        #stunt_profile = StuntProfile.new
        #stunt_profile.save(:validate => false)
        #self.stunt_profile = stunt_profile
        #stunt_profile.user = self
        #stunt_profile.save(:validate => false)



    end
end
