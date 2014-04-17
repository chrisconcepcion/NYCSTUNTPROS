class CreateStuntProfiles < ActiveRecord::Migration
  def change
    create_table :stunt_profiles do |t|
      t.integer :user_id
      t.integer :age
      t.string :occupation
      t.float :height
      t.float :weight
      t.string :physique
      t.string :ethnicity
      t.string :eye_color
      t.string :hair_color
      t.string :hair_length
      t.float :neck_size
      t.float :sleeve_size
      t.string :suit_size
      t.float :waist
      t.float :pant_length
      t.float :shoe_size
      t.float :hat_size
      t.string :glove_size
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :website
      t.text :skills
      t.text :education
      t.text :training
      t.text :work_history
      t.text :job_categories
      t.text :post_job_titles
      t.integer :unpaid_work
      t.integer :authorized_to_work
      t.string :primary_citizenship
      t.integer :valid_passport

      t.timestamps
    end
  end
end
