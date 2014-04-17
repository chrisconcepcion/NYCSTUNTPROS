# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stunt_profile do
    user_id 1
    age 1
    occupation "MyString"
    height 1.5
    weight 1.5
    physique "MyString"
    ethnicity "MyString"
    eye_color "MyString"
    hair_color "MyString"
    hair_length "MyString"
    neck_size 1.5
    sleeve_size 1.5
    suit_size "MyString"
    waist 1.5
    pant_length 1.5
    shoe_size 1.5
    hat_size 1.5
    glove_size "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    phone_number "MyString"
    website "MyString"
    skills "MyText"
    education "MyText"
    training "MyText"
    work_history "MyText"
    job_categories "MyText"
    post_job_titles "MyText"
    unpaid_work 1
    authorized_to_work 1
    primary_citizenship "MyString"
    valid_passport 1
  end
end
