def output_member_message(length) 
    if length == 1 
        puts "There is #{length} member in the group"
    elsif length == 0 
        puts "The group is empty"
    else 
        puts "There are #{length} members in the group"
    end 
end

def menu_input_select
    puts "Press 1) to add a member to the group." 
    puts "Press 2) to display a random group."
    puts "Press 3) to quit"
    input = gets.chomp.to_i
    return input
end

def add_name_to_group(group)
    puts "Enter name to add:"
    name = gets.chomp
    group.push(name)
end 