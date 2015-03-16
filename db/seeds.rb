# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(first_name: "Pat", last_name: "Walsh", email: "patwalsh@example.com", password: "example", gender: "male", roles:"coordinator", date_of_birth: "2006-09-10")
user1.create_profile!(height: 70, weight: 160)
user1.profile.create_contact(phone_number:"(718)-999-9999", email: "patwalsh@example.com", city:"New York", state:"New York")
user1.profile.create_employment!


user2 = User.create(first_name: "Cat", last_name: "Walsh", email: "catwalsh@example.com", password: "example", gender: "female", roles:"coordinator", date_of_birth: "2006-09-10")
user2.create_profile!(height: 70, weight: 160)
user2.profile.create_contact(phone_number:"(718)-999-9999", email: "catwalsh@example.com", city:"Bronx", state:"New York")
user2.profile.create_employment!

user3 = User.create(first_name: "Rat", last_name: "Walsh", email: "ratwalsh@example.com", password: "example", gender: "male", roles:"coordinator", date_of_birth: "2006-09-10")
user3.create_profile!(height: 70, weight: 160)
user3.profile.create_contact(phone_number:"(718)-999-9999", email: "ratwalsh@example.com", city:"Queens", state:"New York")
user3.profile.create_employment!

user4 = User.create(first_name: "Mat", last_name: "Walsh", email: "matwalsh@example.com", password: "example", gender: "male", roles:"coordinator", date_of_birth: "2006-09-10")
user4.create_profile!(height: 70, weight: 160)
user4.profile.create_contact(phone_number:"(718)-999-9999", email: "matwalsh@example.com", city:"Brooklyn", state:"New York")
user4.profile.create_employment!

user5 = User.create(first_name: "Mat", last_name: "Walsh", email: "mmatwalsh@example.com", password: "example", gender: "male", roles:"coordinator", date_of_birth: "2006-09-10")
user5.create_profile!(height: 70, weight: 160)
user5.profile.create_contact(phone_number:"(718)-999-9999", email: "mmatwalsh@example.com", city:"Brooklyn", state:"New York")
user5.profile.create_employment!

user6 = User.create(first_name: "Mat", last_name: "Walsh", email: "mwwwatwalsh@example.com", password: "example", gender: "male", roles:"coordinator", date_of_birth: "2006-09-10")
user6.create_profile!(height: 70, weight: 160)
user6.profile.create_contact(phone_number:"(718)-999-9999", email: "mwwwatwalsh@example.com", city:"Brooklyn", state:"New York")
user6.profile.create_employment!

user7 = User.create(first_name: "Mat", last_name: "Walsh", email: "ffffmatwalsh@example.com", password: "example", gender: "male", roles:"coordinator", date_of_birth: "2006-09-10")
user7.create_profile!(height: 70, weight: 160)
user7.profile.create_contact(phone_number:"(718)-999-9999", email: "ffffmatwalsh@example.com", city:"Brooklyn", state:"New York")
user7.profile.create_employment!

user8 = User.create(first_name: "Mat", last_name: "Walsh", email: "ytytymatwalsh@example.com", password: "example", gender: "male", roles:"coordinator", date_of_birth: "2006-09-10")
user8.create_profile!(height: 70, weight: 160)
user8.profile.create_contact(phone_number:"(718)-999-9999", email: "ytytymatwalsh@example.com", city:"Brooklyn", state:"New York")
user8.profile.create_employment!

user9 = User.create(first_name: "Mike", last_name: "Top", email: "miketops@example.com", password: "example", gender: "male", roles:"actor", date_of_birth: "2006-09-10")
user9.create_profile!(height: 70, weight: 160)
user9.profile.create_contact(phone_number:"(718)-999-9999", email: "miketops@example.com", city:"Brooklyn", state:"New York")
user9.profile.create_employment!

user10 = User.create(first_name: "Chris", last_name: "Poops", email: "chrispoops@example.com", password: "example", gender: "male", roles:"actor", date_of_birth: "2006-09-10")
user10.create_profile!(height: 70, weight: 160)
user10.profile.create_contact(phone_number:"(718)-999-9999", email: "chrispoops@example.com", city:"Brooklyn", state:"New York")
user10.profile.create_employment!

user11 = User.create(first_name: "Rich", last_name: "Peace", email: "richpeace@example.com", password: "example", gender: "male", roles:"actor", date_of_birth: "2006-09-10")
user11.create_profile!(height: 70, weight: 160)
user11.profile.create_contact(phone_number:"(718)-999-9999", email: "richpeace@example.com", city:"Brooklyn", state:"New York")

user11.profile.create_employment!

user12 = User.create(first_name: "Joe", last_name: "Smo", email: "joesmo@example.com", password: "example", gender: "male", roles:"actor", date_of_birth: "2006-09-10")
user12.create_profile!(height: 70, weight: 160)
user12.profile.create_contact(phone_number:"(718)-999-9999", email: "joesmo@example.com", city:"Brooklyn", state:"New York")
user12.profile.create_employment!

user14 = User.create(first_name: "Mama", last_name: "Peace", email: "mama@example.com", password: "example", gender: "female", roles:"actor", date_of_birth: "2006-09-10")
user14.create_profile!(height: 70, weight: 160)
user14.profile.create_contact(phone_number:"(718)-999-9999", email: "mama@example.com", city:"Brooklyn", state:"New York")
user14.profile.create_employment!

user13 = User.create(first_name: "Jill", last_name: "Smo", email: "jill@example.com", password: "example", gender: "female", roles:"actor", date_of_birth: "2006-09-10")
user13.create_profile!(height: 70, weight: 160)
user13.profile.create_contact(phone_number:"(718)-999-9999", email: "jill@example.com", city:"Brooklyn", state:"New York")
user13.profile.create_employment!

user15 = User.create(first_name: "Rosa", last_name: "Peace", email: "rosa@example.com", password: "example", gender: "female", roles:"actor", date_of_birth: "2006-09-10")
user15.create_profile!(height: 70, weight: 160)
user15.profile.create_contact(phone_number:"(718)-999-9999", email: "rosa@example.com", city:"Brooklyn", state:"New York")
user15.profile.create_employment!

user16 = User.create(first_name: "Angie", last_name: "Smo", email: "ang@example.com", password: "example", gender: "female", roles:"actor", date_of_birth: "2006-09-10")
user16.create_profile!(height: 70, weight: 160)
user16.profile.create_contact(phone_number:"(718)-999-9999", email: "ang@example.com", city:"Brooklyn", state:"New York")
user16.profile.create_employment!