class Feeling < ActiveRecord::Base
    belongs_to :patient
    belongs_to :symptom 
end 