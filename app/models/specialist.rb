require "pry";

class Specialist < ActiveRecord::Base
    has_many :diagnoses
    has_many :patients, through: :diagnoses 
    
    
    def referral(sym, date)
        if sym.symptom == "Migraine" 
            self.specialist = "Neurologist"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
        elsif sym.symptom == "Chest_pain" 
            self.specialist = "Cardiologist"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
        elsif sym.symptom == "Difficulty_breathing" 
            self.specialist = "Pulmonologist"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
        elsif sym.symptom == "Fracture" 
            self.specialist = "Orthopedic"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
        elsif sym.symptom == "Rash" 
            self.specialist = "Dermatologist"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
        elsif   sym.symptom == "Abdominal_pain" 
            self.specialist = "gastroenterologist"
            
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            
            self.diagnoses<<dg
            dg
        elsif sym.symptom == "Eye_pain" 
            self.specialist = "Opthamologist"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
        elsif sym.symptom == "Head_injury" 
            self.specialist = "Neurology"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
        elsif  sym.symptom == "Sprain" 
            self.specialist = "Orthopedic"
            dg = Diagnosis.create(spec_name: self.specialist, ref_date: date, specialist_id: self.id)
            self.diagnoses<<dg
            dg
           
        end
        dg 


    end

   
end 