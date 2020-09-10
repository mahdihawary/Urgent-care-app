class Patient < ActiveRecord::Base
    has_many :diagnoses
    has_many :specialists, through: :diagnoses 
    has_many :feelings
    has_many :symptoms, through: :feelings
    has_one :covid_test
    


    def my_symptoms
        self.symptoms.all.map{|ps| ps.symptom}
    end



end 