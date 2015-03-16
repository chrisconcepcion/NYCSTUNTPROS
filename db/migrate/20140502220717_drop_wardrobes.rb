class DropWardrobes < ActiveRecord::Migration
  def change
		drop_table :wardrobes
  end
end
