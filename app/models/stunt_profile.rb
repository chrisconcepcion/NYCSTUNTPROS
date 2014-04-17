class StuntProfile < ActiveRecord::Base
	belongs_to :user
	
	has_many :films, dependent: :destroy
	accepts_nested_attributes_for :films, :allow_destroy => true, :reject_if => :all_blank

	has_many :televisions, dependent: :destroy
	accepts_nested_attributes_for :televisions, :allow_destroy => true, :reject_if => :all_blank
	
	has_many :commercials, dependent: :destroy
	accepts_nested_attributes_for :commercials, :allow_destroy => true, :reject_if => :all_blank

	has_many :music_videos, dependent: :destroy
	accepts_nested_attributes_for :music_videos, :allow_destroy => true, :reject_if => :all_blank

	has_many :video_games, dependent: :destroy
	accepts_nested_attributes_for :video_games, :allow_destroy => true, :reject_if => :all_blank

	has_many :industrials, dependent: :destroy
	accepts_nested_attributes_for :industrials, :allow_destroy => true, :reject_if => :all_blank

	has_many :profile_pictures, dependent: :destroy
	accepts_nested_attributes_for :profile_pictures, :allow_destroy => true, :reject_if => :all_blank

	validates :occupation, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only letters allowed." }

end
