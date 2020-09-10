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
        cli.menu2(current_patient)
    end
    
    
end

new_run = Run.new
new_run.run