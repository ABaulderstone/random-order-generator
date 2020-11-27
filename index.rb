# INPUTS: Menu choice, name, options for quit etc 
# DATA: Array of names
# OUTPUT: Size of class, Menu, names, prompts for quit
# ADD PERSON IMPLEMENTION: User input, add to array .push?
# RANDOM ORDER IMPLEMENTATION: Copy array, select random name - get random index (number between 0 and array length -1 )
#   get name at random index, delete name from array, keep going until array length == 0

require_relative('methods')
group = ["Alex", "Daniel", "Cat", "Andrew", "Jario", "Varsha"]


while true
    output_member_message(group.length)
    case menu_input_select
    when 1 
        add_name_to_group(group)
    when 2
        random_group_running = true
        while random_group_running 
            display_random_order(group)
            puts "Press 1 go back"
            puts "Press 2 to quit"
            puts "press any other key to regenerate order"
            random_group_menu_choice = gets.chomp.to_i
            
            if random_group_menu_choice == 1
                random_group_running = false 
            elsif random_group_menu_choice == 2 
                exit
            end
    

        end  

    when 3
       quit_program
    else 
        puts "Invalid input"
    end
    puts "Press any key to continue"
    gets
    system "clear"
end 

puts "Goodbye"
