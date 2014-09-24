Fabricator(:user) do
	password { "lololol" }
	email { Faker::Internet.email }
    gender { %w(male female).sample }
    roles { %w(actor coordinator).sample }
		date_of_birth "2006-09-10"
end

Fabricator(:invalid_user, from: :user) do
	password { "" }
	email { Faker::Internet.email }
  gender { %w(male female).sample }
	roles { %w(actor coordinator).sample }
end

Fabricator(:stunt_coordinator, from: :user) do
	roles "coordinator"
end

Fabricator(:stunt_master, from: :user) do
	gender { %w(male female).sample }
	roles "both"
end

Fabricator(:male_stunt_master, from: :user) do
	gender "male"
	roles "both"
end

Fabricator(:female_stunt_master, from: :user) do
	gender "female"
	roles "both"
end

Fabricator(:male_stunt_actor, from: :user) do
	gender "male"
	roles "actor"
end

Fabricator(:female_stunt_actor, from: :user) do
	gender "female"
	roles "actor"
end

Fabricator(:stunt_actor, from: :user) do
	roles "actor"
end