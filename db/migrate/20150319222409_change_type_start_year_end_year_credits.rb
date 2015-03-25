class ChangeTypeStartYearEndYearCredits < ActiveRecord::Migration
  def change
		change_column :credits, :start_year, :string
		change_column :credits, :end_year,  :string
		change_column :credits, :start_year,  'integer USING CAST(start_year AS integer)'
		change_column :credits, :end_year,  'integer USING CAST(end_year AS integer)'
  end
end
