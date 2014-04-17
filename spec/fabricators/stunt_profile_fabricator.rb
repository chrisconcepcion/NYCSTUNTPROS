Fabricator(:stunt_profile) do
	age 28
	height 6
	weight 170
	#user {Fabricate(:user)}
	#film {Fabricate(:film)}
end


Fabricator(:film) do
	credit_type 'Film'
	project_title 'Test'
	role 'test'
	company 'test'	
end

Fabricator(:television) do
	credit_type 'Television'
	project_title 'Test'
	role 'test'
	company 'test'	
end

Fabricator(:commercial) do
	credit_type 'Commercial'
	project_title 'Test'
	role 'test'
	company 'test'	
end

Fabricator(:music_video) do
	credit_type 'MusicVideo'
	project_title 'Test'
	role 'test'
	company 'test'	
end

Fabricator(:video_game) do
	credit_type 'VideoGame'
	project_title 'Test'
	role 'test'
	company 'test'	
end

Fabricator(:industrial) do
	project_title 'Test'
	role 'test'
	company 'test'	
end