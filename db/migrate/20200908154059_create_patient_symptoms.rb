class CreatePatientSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :patients_symptoms do |t|
      t.string :symptom
      t.integer :patient_id
      t.integer :symptom_id
    end
  end
end
