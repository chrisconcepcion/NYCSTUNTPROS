class ChangeDatatypeToInteger < ActiveRecord::Migration
  def change
  	change_column :stunt_profiles, :height, :integer
  	change_column :stunt_profiles, :weight, :integer
  	change_column :stunt_profiles, :physique, :integer
  	change_column :stunt_profiles, :ethnicity, :integer
  	change_column :stunt_profiles, :eye_color, :integer
  	change_column :stunt_profiles, :hair_color, :integer
  	change_column :stunt_profiles, :hair_length, :integer
  	change_column :stunt_profiles, :neck_size, :integer
  	change_column :stunt_profiles, :sleeve_size, :integer
  	change_column :stunt_profiles, :suit_size, :integer
  	change_column :stunt_profiles, :waist, :integer
  	change_column :stunt_profiles, :pant_length, :integer
  	change_column :stunt_profiles, :shoe_size, :integer
  	change_column :stunt_profiles, :hat_size, :integer
  	change_column :stunt_profiles, :unpaid_work, :boolean
  	change_column :stunt_profiles, :authorized_to_work, :boolean
  	change_column :stunt_profiles, :valid_passport, :boolean

  end
end
