class Credit < ActiveRecord::Base
	belongs_to :stunt_profile
	self.inheritance_column = :credit_type
end
