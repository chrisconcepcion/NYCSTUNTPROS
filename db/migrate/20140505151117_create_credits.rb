class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
			t.string :type, :project_name, :role, :company
    end
  end
end
