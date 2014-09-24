class AddStartYearAndEndYearToCredits < ActiveRecord::Migration
  def change
		add_column :credits, :start_year, :date
		add_column :credits, :end_year, :date
  end
end
