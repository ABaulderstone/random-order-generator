require 'tty-prompt'
require 'artii'

class GroupView 
    def initialize 
        @prompt = TTY::Prompt.new
        @art = Artii::Base.new
    end 
    
    def menu_selection(question, choices)
       choice = @prompt.select(question, choices)
       return choice
    end

    def display_name(input)
        system "clear"
        puts "You have selected:"
        sleep(0.2)
        p "."
        sleep(0.2)
        p "."
        sleep(0.2)
        p "."
        puts @art.asciify(input)
    end 

    def display_group(group)
        group.each do |member|
            puts "..."
            sleep(0.5)
            puts member
        end
    end

    def input_name(alter)
        @prompt.ask("Please enter name to #{alter}") do |q|
            q.required true
            q.validate /\A\w+\Z/
            q.modify   :capitalize
          end
    end

    def  input_group_name
        @prompt.ask("Please enter group name") do |q|
            q.required true
          end
    end

    def output_member_message(length) 
        if length == 1 
            puts "There is #{length} member in the group"
        elsif length == 0 
            puts "The group is empty"
        else 
            puts "There are #{length} members in the group"
        end 
    end

end 

view = GroupView.new
