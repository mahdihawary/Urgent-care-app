class Covid_test<ActiveRecord::Base
    belongs_to :patients 

    def covid_test_appointment(location, time, patient_id, test_type)
        self.test_location = location
        self.test_appointment = appointment 
        self.patient_id = patient_id
        self.test_type = test_type 
    end 

    def 
end 