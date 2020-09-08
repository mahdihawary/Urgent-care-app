class Symptom< ActiveRecord::Base
    has_many :patients, through: :patients_symptom 

    def patient_symptom
        Patients_symptom.all.select{|ps| ps.Symptom == self}
    end
  

end 