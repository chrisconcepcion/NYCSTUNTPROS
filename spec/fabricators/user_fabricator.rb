Fabricator(:user) do
	password { Faker::Internet.email }
	email { Faker::Internet.email }
end