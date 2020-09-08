class CreateCovidTest < ActiveRecord::Migration[6.0]
  def change
    create_table :covid_tests do |t|
      t.string :test_location
      t.string :test_appointment 
      t.string :result 
      t.integer :patient_id
      t.string :test_type
    end
  end
end
