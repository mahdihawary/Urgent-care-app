class Patient < ActiveRecord::Base
    has_many :diagnoses
    has_many :specialists, through: :diagnoses 
    has_many :feelings
    has_many :symptoms, through: :feelings
    has_one :covid_test
    
    
    # def date_of_symptom
    #     Time.now.strftime("%d/%m/%Y")
    # end

    # #if we need a method for username password
    # def create_patient_symptom 
    #     patient_symptom.new(self.id)
    # end 

    # def patient_symptom
    #   Symptom.all.select{|ps| ps.id == self.id}
    # end

    def my_symptoms
        self.symptoms.all.map{|ps| ps.symptom}
    end

    # def my_diagnosis
    #     Diagnosis.all.select{|c| c.patient == self}
    # end

    # def covid_test_appointment
    #     Covid_test.all.select{|c| c.patient == self}
    # end
    
    # def covid_test_appointment
    # end


end 