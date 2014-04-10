class CreateWardrobe < ActiveRecord::Migration
  def change
    create_table :wardrobes do |t|
        t.integer :profile_id, :height
        t.string :physique, :ethnicity, :eye_color, :hair_color, :hair_length, :shirt_neck, :shirt_sleeve, :suit_dress_size, :pants_waist, :pants_inseam, :shoe_size, :hat_size, :glove_size
    end
  end
end
