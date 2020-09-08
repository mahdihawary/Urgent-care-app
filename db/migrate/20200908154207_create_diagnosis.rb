class CreateDiagnosis < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :diagnosis
      t.integer :user_id
      t.integer :specialist_id 
    end 
  end
end
