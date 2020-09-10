class Symptom < ActiveRecord::Base
    has_many :feelings
    has_many :patients, through: :feelings 
    

    
end 