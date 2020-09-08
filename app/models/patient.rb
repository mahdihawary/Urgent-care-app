class Patient < ActiveRecord::Base
    has_many :specialists, through: :diagnoses 
    has_many :symptoms, through: :patient_symptoms
    def date_of_symptom
        Time.now.strftime("%d/%m/%Y")
    end

    # #if we need a method for username password
    # def create_patient_symptom 
    #     patient_symptom.new(self.id)
    # end 

    # def patient_symptom
    #     Patient_symptom.all.select{|ps| ps.id == self.id}
    # end

    # def my_symptoms
    #     self.patient_symptom.all.map{|ps| ps.Symptom}
    # end

    # def my_diagnosis
    #     Diagnosis.all.select{|c| c.patient == self}
    # end

    # def covid_test_appointment
    #     Covid_test.all.select{|c| c.patient == self}
    # end
    
    # def covid_test_appointment
    # end


end 