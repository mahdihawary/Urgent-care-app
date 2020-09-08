class Patient < ActiveRecord::Base
    has_many :specialists, through: :diagnoses 
    has_many :symptoms, through: :patient_symptoms


end 