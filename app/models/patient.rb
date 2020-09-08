class Patient < ActiveRecord::Base
    has_many :specialists, through: :diagnoses 
    has_many :symptoms, through: :patients_symptoms
    def date_of_symptom
        Time.now.strftime("%d/%m/%Y")
    end

    #if we need a method for username password

    def patients_symptom
        Patients_symptom.all.select{|ps| ps.patient_id == self.patient_id}
    end

    def my_symptoms
        self.patients_symptom.all.map{|ps| ps.Symptom}
    end

    def my_diagnosis
        Diagnosis.all.select{|c| c.patient == self}
    end

    def covid_test_appointment
        Covid_test.all.select{|c| c.patient == self}
    end
    
    def covid_test_appointment
    end


end 