class Profile < ActiveRecord::Base
	has_many :credits
  belongs_to :user
  has_one :contact
  has_one :employment
	accepts_nested_attributes_for :contact
	accepts_nested_attributes_for :employment
	accepts_nested_attributes_for :credits
  validates :user_id, presence: true
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	has_attached_file :photo, :styles => { :small => "190x220!", :large => "570x660" },
	:processors => [:cropper]
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => /^image/ 
	validates_numericality_of :height, :only_integer => true, :allow_nil => true, 
    :greater_than_or_equal_to => 48,
    :less_than_or_equal_to => 96,
		:message => "is not included in the list"
	validates :physique, :inclusion => %w(slim average athletic muscular heavyset), allow_nil: true, :allow_blank => true
	validates :eye_color, :inclusion => %w(amber blue brown green grey hazel), allow_nil: true, :allow_blank => true
	validates :hair_color, :inclusion => %w(black brown blond auburn chestnut red gray), allow_nil: true, :allow_blank => true
	validates :hair_length, :inclusion => %w(short medium long), allow_nil: true, :allow_blank => true
	validates :ethnicity, :inclusion => %w(asian biracial indian hispanic middle_eastern native_american pacific_islander caucasian other), allow_nil: true,:allow_blank => true
	

 
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
 
  def photo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(path)
  end
	
  def reprocess_photo
    photo.reprocess!
  end
	

	def wardrobe_height
		if self.height.blank?
		else
			(self.height/12).to_s + " feet"
		end
	end

	def contact_city_and_state
		if self.contact.city && self.contact.state					
			self.contact.city + ", " + self.contact.state 
		end
	end
 

end