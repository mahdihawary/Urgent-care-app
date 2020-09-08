class Symptom< ActiveRecord::Base
    has_many :patients, through: :patient_symptoms 

    # def patient_symptom
    #     Patient_symptom.all.select{|ps| ps.Symptom == self}
    # end
end 