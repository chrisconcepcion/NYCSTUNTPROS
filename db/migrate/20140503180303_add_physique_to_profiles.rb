class AddPhysiqueToProfiles < ActiveRecord::Migration
  def change
		add_column :profiles, :physique, :string
  end
end
