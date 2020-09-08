class Symptom< ActiveRecord::Base
has_many :patients, through: :patient_symptom 
end 