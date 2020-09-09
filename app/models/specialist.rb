class Specialist < ActiveRecord::Base
    has_many :diagnoses
    has_many :patients, through: :diagnoses 
    
    


end 