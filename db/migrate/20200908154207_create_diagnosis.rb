class CreateDiagnosis < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.string :spec_name
      t.integer :patient_id
      t.integer :specialist_id 
      t.date :ref_date
    end 
  end
end
