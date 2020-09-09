class Symptom < ActiveRecord::Base
    has_many :feelings
    has_many :patients, through: :feelings 
    

    # def patient_symptom
    #     Patient_symptom.all.select{|ps| ps.Symptom == self}
    # end
end 