Fabricator(:user) do
	password { "lololol" }
	email { Faker::Internet.email }
    gender { %w(male female).sample }
    roles { %w(actor coordinator).sample }
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