require 'spec_helper'

describe Credit do
	it {	should validate_presence_of(:profile_id) }
	it {	should validate_presence_of(:project_name) }
	it {  should validate_presence_of(:role) }
	it {  should validate_presence_of(:company) }
	it {  should validate_presence_of(:start_year) }
	it {  should ensure_inclusion_of(:media_category).in_array(%w[film television commercial music_videos video_games industrial]) }
	it { should belong_to(:profile) }
end