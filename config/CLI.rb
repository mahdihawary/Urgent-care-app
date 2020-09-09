
prompt = TTY::Prompt.new

prompt.ask("Welcome to Flatiron Urgent care lobby")
answer=prompt.yes?("Do you have a username and password?")
if answer == y || yes
    username = prompt.ask("Please enter your username")
    password = prompt.mask("Please enter your password")
    if username == patient.name && password == patient.password
elsif answer == n || no
    username1 = prompt.ask("Please enter your username")
    password2 = prompt.mask("Please enter your password")
end

prompt.select("Choose your Symptoms", %w(Migraine Head_injury Chest_pain Difficulty_breathing Injury Sprain Rash Abdominal_pain Eye_pain)
