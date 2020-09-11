require "tty-prompt"
require 'pry'
class CommandLineInterface


    prompt = TTY::Prompt.new
    def greeting
        system("clear")
        prompt = TTY::Prompt.new
        prompt.ask("Welcome to Flatiron Urgent Care! Please Press Enter to Continue")

    end 

    def login
        system("clear")
        prompt = TTY::Prompt.new
        username = prompt.ask("Please enter your username")
        password = prompt.mask("Please enter your password") 
        current_patient = Patient.all.find{ |p| p.name == username }
        
        if current_patient == nil 
            puts "It looks like that username does not exist please create a new account"
            self.sign_up
        end
        if password != current_patient.password
            puts "You hav input the incorrect password, please try again."
            self.login
        end

        current_patient
    end 

    def sign_up
        system("clear")
        prompt = TTY::Prompt.new
        username1 = prompt.ask("Please enter your username")
        password1 = prompt.mask("Please enter your password")
        Patient.create(password:password1, name:username1) 
        current_patient = Patient.all.find{ |p| p.name == username1  && p.password == password1 }
        if current_patient.name == nil ||current_patient.name == nil
            puts "It looks like that username does not exist please create a new account"
            self.sign_up
        end
        current_patient
    end 

    def choose_symptoms(current_patient)
        system("clear")
        prompt = TTY::Prompt.new
        chosen = prompt.select("Choose your Symptoms", %w(Migraine Head\ injury Chest\ pain Difficulty\ breathing Fracture Sprain Rash Abdominal\ pain Eye\ pain))
        chosen_symptom = Symptom.create(symptom:chosen, date:Date.today)
        Feeling.new(patient: current_patient, symptom: chosen_symptom)
        current_patient.symptoms<< chosen_symptom
    end 

    def which_test(current_patient)
        system("clear")
        test = Covid_test.create(patient: current_patient)
        if current_patient.my_symptoms.include?("Migraine" || "Head injury" || "Chest pain" || "Difficulty breathing" || "Abdominal pain" )
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
        puts "Please select a date for your referral appointment.(mm/dd/yyyy)"
        date = gets.chomp
    end

    def display_referral(patient)
        system("clear")
        puts "Your appointment is with a " + patient.diagnoses.last.spec_name +
        " and your appointment is "+ patient.diagnoses.last.ref_date.to_s
    end

    def display_symptoms(patient)
        system("clear")
        patient.symptoms.each do |s|
            puts "On " +s.date.to_s + " you reported having a " + s.symptom
        end
        
    end

     
    def find_locations
        system("clear")
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

    def done?(current_patient)
        prompt = TTY::Prompt.new
        choice = prompt.yes?("Would you like to do anything else?")
            if choice   
                self.menu2(current_patient)
            elsif 
                puts "Thank you for using the Urgent Care App, have a nice day!"
            end
    end

    def menu2(current_patient)
        prompt = TTY::Prompt.new
        selections2 = prompt.select("Please Select One of the Below Options", 
        %w(Choose\ Symptom See\ my\ test See\ my\ referral Display\ previous\ symptoms Find\ locations Exit))
        if selections2 == "Choose Symptom"
            self.choose_symptoms(current_patient)
            date = self.pick_date
            self.my_referral(current_patient,current_patient.symptoms.last, date)
            self.done?(current_patient)
        elsif selections2 == "Display previous symptoms"
            display_symptoms(current_patient)
            self.done?(current_patient)
        elsif selections2 == "Find locations"
            self.find_locations
            self.done?(current_patient)
        elsif selections2 == "See my test"
            self.which_test(current_patient)
            self.done?(current_patient)
        elsif selections2 == "See my referral"
            self.display_referral(current_patient)
            self.done?(current_patient)
        elsif selections2 == "Exit"    
            system("clear")
            puts "Thank you for using the Urgent Care App, have a nice day!"    
        end

    end
end     
