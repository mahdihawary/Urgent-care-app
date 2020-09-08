class CreateSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :symptoms do |t|
      t.string :symptom
      t.string :name
      t.string :date
    end 
  end
end
