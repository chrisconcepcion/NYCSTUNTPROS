class Profile < ActiveRecord::Base
    belongs_to :user
    has_one :wardrobe
    has_one :contact
    has_one :employment
    validates :user_id, presence: true

end