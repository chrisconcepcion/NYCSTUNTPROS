class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
        t.integer :profile_id
        t.text :skills, :training, :work_history, :job_categories, :past_job_titles
        t.string :primary_citizenship
        t.boolean :work_unpaid, :united_states_citizenship, :valid_passport
    end
  end
end
