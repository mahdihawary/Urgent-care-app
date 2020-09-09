class CreateSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :symptoms do |t|
      t.string :symptom
      t.date :date
    end 
  end
end
