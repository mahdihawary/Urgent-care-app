class Patient_symptom < ActiveRecord::Base
    belongs_to :patient
    belongs_to :symptom 
end 