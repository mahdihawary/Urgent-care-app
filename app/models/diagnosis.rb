class Diagnosis < ActiveRecord::Base
    belongs_to :patients
    belongs_to :specialists 
end 