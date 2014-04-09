Fabricator(:user) do
	password {Faker::Internet.password(8)}
end