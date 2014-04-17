class AddPictureToProfilePictures < ActiveRecord::Migration
  def self.up
    add_attachment :profile_pictures, :picture
  end

  def self.down
    remove_attachment :profile_pictures, :picture
  end
end
