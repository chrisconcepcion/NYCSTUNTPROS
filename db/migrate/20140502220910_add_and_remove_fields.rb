class AddAndRemoveFields < ActiveRecord::Migration
  def change
		remove_column :profiles, :first_name
		remove_column :profiles, :middle_name
  	remove_column :profiles, :last_name
		add_column :profiles, :height, :integer
		add_column :profiles, :ethnicity, :string
		add_column :profiles, :eye_color, :string
		add_column :profiles, :hair_color, :string
		add_column :profiles, :hair_length, :string
		add_column :profiles, :shirt_neck, :string
		add_column :profiles, :shirt_sleeve, :string
		add_column :profiles, :suit_dress_size, :string
		add_column :profiles, :pants_inseam, :string
		add_column :profiles, :pants_waist, :string
		add_column :profiles, :shoe_size, :string
		add_column :profiles, :hat_size, :string
		add_column :profiles, :glove_size, :string
		add_column :profiles, :weight, :integer
	end
end
