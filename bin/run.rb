require_relative '../config/environment'

require 'pry'

class Run
    def run    
        cli = CommandLineInterface.new

        prompt = TTY::Prompt.new 
        cli.greeting
        
        selection = prompt.select("Please Select One of the Below Options", %w(Login Signup))
        if selection == "Login"
            current_patient = cli.login
        elsif selection == "Signup"
            current_patient = cli.sign_up

        end
        self.menu2(cli, current_patient)
    end
    def menu2(cli, current_patient)
        prompt = TTY::Prompt.new
        selections2 = prompt.select("Please Select One of the Below Options", 
        %w(Choose_symptom See_my_test See_my_referral Exit))
        if selections2 == "Choose_symptom"
            
            cli.choose_symptoms(current_patient)
            
            date = cli.pick_date
            cli.my_referral(current_patient,current_patient.symptoms.last, date)
            self.menu2(cli, current_patient)
        elsif selections2 == "See_my_test"
            cli.which_test(current_patient)
           
            self.menu2(cli, current_patient)
            
        elsif selections2 == "See_my_referral"
            cli.display_referral(current_patient)
            self.menu2(cli, current_patient)
        elsif selections2 == "Exit"
        end
    end
    
end

new_run = Run.new
new_run.run