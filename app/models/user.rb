class User < ActiveRecord::Base
	  include ActiveModel::Dirty

	has_secure_password validations: false
  has_one :profile

	validates :password, length: { minimum: 6 }, :on => :create
	validates_presence_of :password, :on => :create
	validates :email, uniqueness: true, presence: true
  validates :gender, :inclusion => %w(male female)
  validates :roles, :inclusion => %w(actor coordinator)
  before_create { generate_token(:auth_token) }
	before_save :populate_full_name
	
  def generate_token(column)
      self[column] = SecureRandom.urlsafe_base64
  end

  def create_profile
		self.create_profile!
    user_profile = self.profile
    user_profile.create_wardrobe!
    user_profile.create_contact!
    user_profile.create_employment!
  end
	
	def self.stunt_coordinators
		self.where("roles = ?", "coordinator")
	end
	
	def self.stunt_coordinators_recent_5
		self.where("roles = ?", "coordinator").order('created_at DESC').limit(5).all
	end
	
	def self.stunt_actors(gender)
		self.where("roles = ? and gender = ?", "actor", "#{gender}")
	end
	
	def self.stunt_actors_recent_5(gender)
		self.where("roles = ? and gender = ?", "actor", "#{gender}").order('created_at DESC').limit(5).all
	end

	def self.search_by_full_name(keyword, gender)
		if keyword.blank? || ["male","female"].exclude?(gender)
			[]
		else
			self.where("gender = ? and full_name LIKE ?","#{gender}","%#{keyword}%").order('created_at DESC')
		end
	end

protected

def populate_full_name
  self.full_name = "#{first_name} #{middle_name} #{last_name}"
end
	
end
