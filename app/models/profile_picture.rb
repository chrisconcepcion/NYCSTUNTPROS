class ProfilePicture < ActiveRecord::Base
	belongs_to :stunt_profile

	has_attached_file :picture, :styles => { :thumb => "200x200>" }
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
