class AddProfileIdToCredits < ActiveRecord::Migration
  def change
		add_column :credits, :profile_id, :integer
  end
end
