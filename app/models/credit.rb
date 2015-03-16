class Credit < ActiveRecord::Base
	belongs_to :profile
	validates :media_category, :inclusion => %w(film television commercial music_videos video_games industrial)
	validates :role, presence: true
	validates :company, presence: true
	validates :start_year, presence: true
	validates :project_name, presence: true
	validates :profile_id, presence: true
	
	def lol_method
		puts self.type
	end
end