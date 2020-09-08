Patient.destroy_all
Specialist.destroy_all

nimr = Patient.create(name: 'nimr', password: "shrimp")
hulk = Patient.create(name: "banner", password: "gamma")
thor = Patient.create(name: "thor", password: "asgard")
black_panther = Patient.create(name: "tchalla", password: "wakanda")
black_widow = Patient.create(name:"natasha", password: "hydra")


# Referral_symptoms = [{"headache": "Neurologist"}, {"migraine": "Neurologist"},{"chest pain": "Cardiologist"}, 
#     {"difficulty breathing": "Pulmonologist"}, {"fall": "Orthopedic"}, {"injury": "Orthopedic"},
#      {"sprain": "Orthopedic"}, {"rash": "Dermatologist"}, 
#     {"stomach pain": "Gastroenterologist"}, {"eye pain": "Opthamologist"}]

    neurologist = Specialist.create(specialist: "neurologist")
    cardiologist = Specialist.create(specialist: "cardiologist")
    pulmonologist = Specialist.create(specialist: "pulmonologist")
    orthopedic = Specialist.create(specialist: "orthopedic")
    dermatologist = Specialist.create(specialist: "dermatologist")
    gastroenterologist = Specialist.create(specialist: "gastroenterologist")
    opthamologist = Specialist.create(specialist: "opthamologist")
    faucci = Specialist.create(specialist: "faucci")