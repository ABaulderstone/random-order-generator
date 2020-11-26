# INPUTS: Menu choice, name, options for quit etc 
# DATA: Array of names
# OUTPUT: Size of class, Menu, names, prompts for quit
# ADD PERSON IMPLEMENTION: User input, add to array .push?
# RANDOM ORDER IMPLEMENTATION: Copy array, select random name - get random index (number between 0 and array length -1 )
#   get name at random index, delete name from array, keep going until array length == 0

require_relative('methods')
group = []


while true
    output_member_message(group.length)
    puts "Press 1) to add a member to the group." 
    puts "Press 2) to display a random group."
    puts "Press 3) to quit"
    menu_input = gets.chomp.to_i
    
    case menu_input
    when 1 
        puts "Enter name to add:"
        name = gets.chomp
        group.push(name)
        # group << name
    when 2
        random_group_running = true
        while random_group_running 
            copied_group = group.clone
            while copied_group.length > 0 
                random_index = rand((copied_group.length))
                puts copied_group[random_index].capitalize
                copied_group.delete_at(random_index)
            end
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
        puts "Are you sure, type 'yes' to quit"
        quit_choice = gets.chomp
        break if quit_choice.downcase == 'yes'
    else 
        puts "Invalid input"
    end
    puts "Press any key to continue"
    gets
    system "clear"
end 

puts "Goodbye"
