class AddFirstNameMiddleNameLastNameToProfile < ActiveRecord::Migration
  def change
		add_column :profiles, :first_name, :string
		add_column :profiles, :middle_name, :string
		add_column :profiles, :last_name, :string
  end
end
