class User < ActiveRecord::Base
	include ActiveModel::Dirty

	has_secure_password validations: false
  has_one :profile

	validates :password, length: { minimum: 6 }, :on => :create
	validates_presence_of :password, :on => :create
	validates :email, uniqueness: true, presence: true
  validates :gender, :inclusion => %w(male female)
  validates :roles, :inclusion => %w(actor coordinator both)
	validates :date_of_birth, presence: true
  before_create { generate_token(:auth_token) }
	before_save :populate_full_name, :case_sensitive => false
	
  def generate_token(column)
      self[column] = SecureRandom.urlsafe_base64
  end

  def create_profile
		self.create_profile!
    user_profile = self.profile
    user_profile.create_contact!
    user_profile.create_employment!
  end
	
	def self.stunt_coordinators
		self.where({ roles:  [ "coordinator", "both"]})
	end
	
	def self.stunt_coordinators_recent_4
		User.stunt_coordinators.order('created_at DESC').limit(4).all
	end
	
	def self.stunt_actors(gender)
		self.where({ roles:  [ "actor", "both"], gender: ["#{gender}"] })
	end
	
	def self.stunt_actors_recent_4(gender)
		User.stunt_actors(gender).order('created_at DESC').limit(4).all
	end
	
	def self.search_actors_by_full_name(keyword, gender)
		if keyword.blank? || ["male","female"].exclude?(gender)
			[]
		else
			self.where("roles in (?)  and gender = ? and full_name ILIKE ?",["actor", "both"], "#{gender}","%#{keyword}%").order('created_at DESC')
		end
	end
	
	

	def update_password(password, password_confirmation)
		if(password == password_confirmation) && (password.length  >= 6)
	    self.update_attributes(password: password, reset_password_token: nil)
			true
		else
			false
		end
	end
protected

def populate_full_name
  self.full_name = "#{first_name} #{middle_name} #{last_name}"
end
	

end
