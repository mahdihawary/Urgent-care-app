require "tty-prompt"
require 'pry'
class CommandLineInterface


    prompt = TTY::Prompt.new
    def greeting
        prompt = TTY::Prompt.new
        prompt.ask("Welcome to Flatiron Urgent Care! Please Press Enter to Continue")
        # answer=prompt.yes?("Do you have a username and password?")
    end 

    def login
        prompt = TTY::Prompt.new
        username = prompt.ask("Please enter your username")
        password = prompt.mask("Please enter your password") 
        current_patient = Patient.all.find{ |p| p.name == username  && p.password == password }
        if !current_patient
            puts "It looks like that username does not exist please create a new account"
            self.sign_up
        end
        current_patient
    end 

    def sign_up
        prompt = TTY::Prompt.new
        username1 = prompt.ask("Please enter your username")
        password1 = prompt.mask("Please enter your password")
        Patient.create(password:password1, name:username1) 
        current_patient = Patient.all.find{ |p| p.name == username1  && p.password == password1 }
        current_patient
    end 

    def choose_symptoms(current_patient)
        prompt = TTY::Prompt.new
        chosen = prompt.select("Choose your Symptoms", %w(Migraine Head_injury Chest_pain Difficulty_breathing Fracture Sprain Rash Abdominal_pain Eye_pain))
        chosen_symptom = Symptom.create(symptom:chosen)
        Feeling.new(patient: current_patient, symptom: chosen_symptom)
        
        current_patient.symptoms<< chosen_symptom
        
    end 

    def which_test(current_patient)
        test = Covid_test.create(patient: current_patient)
        # current_patient.covid_test = test
        
        if current_patient.my_symptoms.include?("Migraine" || "Head_injury" || "Chest_pain" || "Difficulty_breathing" || "Abdominal_pain" )
            current_patient.covid_test.test_type = "Nasal swab"
            puts "Due to your symptoms you will be getting tested for COVID-19 via nasal swab"
        else 
            puts "You will be getting the COVID-19 antibody test.  "
            current_patient.covid_test.test_type = "Antibody test"
        end
        
    end 

    def my_referral(patient, symptom, date)
       
        spec = Specialist.create
        dg = spec.referral(symptom, Date.today+rand(1000))
        dg.patient = patient
        patient.diagnoses<<dg
        
        
    end 

    def pick_date
        puts "Please select a date.(mm/dd/yyyy)"
        date = gets.chomp
    end

    def display_referral(patient)
        puts "Your appointment is with a " + patient.diagnoses.last.spec_name +
        " and your appointment is "+ patient.diagnoses.last.ref_date.to_s
    end
    
    def find_locations
        response = RestClient.get 'https://covid-19-testing.github.io/locations/new-york/complete.json'
        loc = JSON.parse(response.body)
        
        # Loop through and print data
        for i in 0..9 
            puts "Name: " + loc[i]["name"]
            addy = loc[i]["physical_address"][0]
            puts "Address: " + addy["address_1"] + ", " + addy["city"] + ", " + addy["state_province"] + ", " + addy["postal_code"]
            puts "Phone Number: " + loc[i]["phones"][0]["number"] 
            puts
        end 

    end 
end     
