class User < ActiveRecord::Base
	has_secure_password validations: false

	validates :password, length: { minimum: 6 }
	validates :email, uniqueness: true, presence: true
end