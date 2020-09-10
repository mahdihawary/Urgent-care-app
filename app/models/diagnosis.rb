class Diagnosis < ActiveRecord::Base
    belongs_to :patient
    belongs_to :specialist 
    #takes in an argument of symptoms
    #compares symptoms to use cases 
    #returns specialist patient can be sent to 
    
    
    # Referral_symptoms = [{"headache": "Neurologist"}, {"migraine": "Neurologist"},{"chest pain": "Cardiologist"}, 
    # {"difficulty breathing": "Pulmonologist"}, {"fall": "Orthopedic"}, {"injury": "Orthopedic"},
    #  {"sprain": "Orthopedic"}, {"rash": "Dermatologist"}, 
    # {"stomach pain": "Gastroenterologist"}, {"eye pain": "Opthamologist"}]
    
    #neuro --> headache/ migraine 
    #cardio --> chest pain
    #pulmo --> difficulty breathing 
    #ortho --> fall/injury/ sprain 
    #derm --> rash 
    #gastro --> stomach pain/ n/v
    #opthamol --> eye pain/ discomfort 
    #epidemi --> points to Fauci if you have a pos covid test (nasal swab)





end 