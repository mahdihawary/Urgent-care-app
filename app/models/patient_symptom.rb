class Patient_symptom < ActiveRecord::Base
    belongs_to :patients
    belongs_to :symptoms 
end 