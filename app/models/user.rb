class User < ActiveRecord::Base
	has_secure_password validations: false
    has_one :profile

	validates :password, length: { minimum: 6 }
	validates :email, uniqueness: true, presence: true
    validates :gender, :inclusion => %w(male female)
    validates :roles, :inclusion => %w(actor coordinator)
    after_create { generate_token(:auth_token) }

  def generate_token(column)
      self.update_attribute(column, SecureRandom.urlsafe_base64)
  end

    def create_profile
        self.create_profile!
        user_profile = self.profile
        user_profile.create_wardrobe!
        user_profile.create_contact!
        user_profile.create_employment!
    end
end
