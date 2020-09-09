require "tty-prompt"
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
    end 

    def sign_up
        prompt = TTY::Prompt.new
        username1 = prompt.ask("Please enter your username")
        password2 = prompt.mask("Please enter your password")
        Patient.create(password:password2, username:username2) 
        current_patient = Patient.all.find{ |p| p.name == username  && p.password == password }
    end 

    def choose_symptoms(current_patient)
        chosen = prompt.select("Choose your Symptoms", %w(Migraine Head_injury Chest_pain Difficulty_breathing Fracture Sprain Rash Abdominal_pain Eye_pain))
        current_patient.symptoms<< chosen.to_s 
    end 
    def which_test(current_patient)
        test = Covid_test.create(patient: current_patient)
        current_patient.covid_test = test
        if current_patient.symptoms.include?("Migraine" || "Head_injury" || "Chest_pain" || "Difficulty_breathing" || "Abdominal_pain" )
            current_patient.covide_test.test_type = "Nasal swab"
            puts "Due to your symptoms you will be getting tested for COVID-19 via nasal swab"
        else 
            puts "You will be getting the COVID-19 antibody test.  "
            current_patient.covide_test.test_type = "Antibody test"
        end


    end


    def run
            prompt = TTY::Prompt.new
            # welcome = prompt.select("Welcome to Flatiron Urgent Care! Please Press Enter to Continue") 
            greeting
            selection = prompt.select("Please Select One of the Below Options", %w(Login Signup))
            if selection == "Login"
                current_patient = self.login
            elsif selection == "Signup"
                current_patient = self.sign_up
            end
            self.choose_symptoms(current_patient)
            
            


    end 
end 


new_run = CommandLineInterface.new
new_run.run