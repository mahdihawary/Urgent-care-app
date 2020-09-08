class CreateSpecialists < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :specilist
      t.string :appointment 
    end 
  end
end
