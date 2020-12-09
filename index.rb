# INPUTS: Menu choice, name, options for quit etc 
# DATA: Array of names
# OUTPUT: Size of class, Menu, names, prompts for quit
# ADD PERSON IMPLEMENTION: User input, add to array .push?
# RANDOM ORDER IMPLEMENTATION: Copy array, select random name - get random index (number between 0 and array length -1 )
#   get name at random index, delete name from array, keep going until array length == 0

require_relative('methods')
require 'espeak'
require_relative 'group'

#handling command line arguments
if ARGV.length > 0 
    flag, *rest = ARGV
    ARGV.clear

    case flag
    when '-help' 
        puts "please see readme for instructions"
        exit(0)
    when '-path'
        group = Group.new("Test", rest[0])
    when '-quick'
    else 
        puts "Unrecognised flag"
        exit(0) 
    end 

end 

# Intialise group 
group ||= Group.new("Test Group", './groups/test-group.txt')


while true
    output_member_message(group.names_array.length)
    case menu_input_select
    when 1
        adding = true 
        while adding
            puts "Enter name to add "
            name = gets.chomp
            group.add_name(name)
            puts "#{name} added to group, would you like to add another?"
            unless gets.chomp.downcase == 'yes' 
                adding = false 
            end 
        end 

    when 2
        group.display_random_order
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
