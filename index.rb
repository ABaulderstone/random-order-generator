# INPUTS: Menu choice, name, options for quit etc 
# DATA: Array of names
# OUTPUT: Size of class, Menu, names, prompts for quit
# ADD PERSON IMPLEMENTION: User input, add to array .push?
# RANDOM ORDER IMPLEMENTATION: Copy array, select random name, get random index (number between 0 and array length -1 )
#   get name at random index, delete name from array, keep going until array length == 0

group = []


while true
    puts "Press 1) to add a member to the group." 
    puts "Press 2) to display a random group."
    puts "Press 3) to quit"
    menu_input = gets.chomp.to_i
    
    case menu_input
    when 1 
        puts "You pressed 1"
    when 2 
        puts "You pressed 2"
    when 3
        puts "You pressed 3"
        break
    else 
        puts "Invalid input"
    end
    puts "Press any key to continue"
    gets
    system "clear"
end 
