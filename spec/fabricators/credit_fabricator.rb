Fabricator(:credit) do
	media_category { %w(film television commercial music_videos video_games industrial).sample }
  project_name { Faker::Name.name }
  role { Faker::Name.name }
  company { Faker::Name.name }
  start_year { 1990 }
  end_year { 1991 }
end