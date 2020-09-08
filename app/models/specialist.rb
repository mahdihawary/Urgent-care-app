class Specialist< ActiveRecord::Base
    has_many :patients, through: :diagnosis 

    def my_symptoms
        self.all.select{|s| Symptom.specialist == s}
    end


end 