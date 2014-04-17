class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|
      t.integer :stunt_profile_id
      t.boolean :is_profile_picture

      t.timestamps
    end
  end
end
