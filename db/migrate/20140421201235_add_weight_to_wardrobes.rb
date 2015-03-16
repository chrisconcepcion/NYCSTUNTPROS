class AddWeightToWardrobes < ActiveRecord::Migration
  def change
		add_column :wardrobes, :weight, :integer
  end
end
