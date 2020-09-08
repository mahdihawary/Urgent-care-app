class CreateDiagnosis < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.string :diagnosis
      t.integer :user_id
      t.integer :specialist_id 
    end 
  end
end
