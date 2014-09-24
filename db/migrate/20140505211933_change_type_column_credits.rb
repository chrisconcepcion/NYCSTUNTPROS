class ChangeTypeColumnCredits < ActiveRecord::Migration
  def change
		rename_column :credits, :type, :media_category
  end
end
