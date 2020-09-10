require_relative '../config/environment'



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
        
        selections2 = prompt.select("Please Select One of the Below Options", 
        %w(Choose_symptom See_my_test See_my_referral Exit))
        if selections2 == "Choose_symptom"
            puts "here wwe are"
            cli.choose_symptoms(current_patient)
            cli.which_test(current_patient)
            date = cli.pick_date
            cli.my_referral(current_patient,current_patient.symptoms.last, date)
        elsif selections2 == "See_my_test"
            puts current_patient.covid_test.test_type
            
        elsif selections2 == "See_my_referral"
            cli.display_referral(current_patient)
            
        elsif selections2 == "Exit"
        end
    end
end 
new_run = Run.new
new_run.run