Fabricator(:profile) do
	physique "slim" 
	ethnicity "caucasian" 
	eye_color "blue" 
	hair_color "black"  
	hair_length "short" 
	shirt_neck "10 inches" 
	shirt_sleeve "8 inches" 
	suit_dress_size "10R" 
	pants_waist "32 men" 
	pants_inseam "20 inches" 
	shoe_size "11 men" 
	hat_size "14"
	glove_size "Large" 
	weight 160
	height 60 
end

Fabricator(:profile_photo_resize, from: :profile) do
	crop_x "0"
	crop_y "0" 
	crop_w "528"
	crop_h "595.6923076923077"
end