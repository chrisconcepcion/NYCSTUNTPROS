# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140410213113) do

  create_table "contacts", force: true do |t|
    t.integer "profile_id"
    t.string  "address_line_1"
    t.string  "address_line_2"
    t.string  "city"
    t.string  "state"
    t.string  "zip_code"
    t.string  "phone_number"
    t.string  "email"
    t.string  "website"
  end

  create_table "employments", force: true do |t|
    t.integer "profile_id"
    t.text    "skills"
    t.text    "training"
    t.text    "work_history"
    t.text    "job_categories"
    t.text    "past_job_titles"
    t.string  "primary_citizenship"
    t.boolean "work_unpaid"
    t.boolean "united_states_citizenship"
    t.boolean "valid_passport"
  end

  create_table "profiles", force: true do |t|
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string "email"
    t.string "password_digest"
    t.string "gender"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "roles"
    t.string "auth_token"
  end

  create_table "wardrobes", force: true do |t|
    t.integer "profile_id"
    t.integer "height"
    t.string  "physique"
    t.string  "ethnicity"
    t.string  "eye_color"
    t.string  "hair_color"
    t.string  "hair_length"
    t.string  "shirt_neck"
    t.string  "shirt_sleeve"
    t.string  "suit_dress_size"
    t.string  "pants_waist"
    t.string  "pants_inseam"
    t.string  "shoe_size"
    t.string  "hat_size"
    t.string  "glove_size"
  end

end
