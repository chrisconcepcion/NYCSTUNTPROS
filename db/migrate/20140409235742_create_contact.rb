class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
        t.integer :profile_id
        t.string :address_line_1, :address_line_2, :city, :state, :zip_code, :phone_number, :email, :website 
    end
  end
end
