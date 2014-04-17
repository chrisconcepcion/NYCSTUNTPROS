# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit do
    stunt_profile_id 1
    credit_type "MyString"
    project_title "MyString"
    role "MyString"
    company "MyString"
  end
end
