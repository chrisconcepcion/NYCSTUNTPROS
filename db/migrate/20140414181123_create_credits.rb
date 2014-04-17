class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :stunt_profile_id
      t.string :credit_type
      t.string :project_title
      t.string :role
      t.string :company

      t.timestamps
    end
  end
end
