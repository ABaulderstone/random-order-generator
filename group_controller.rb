require_relative "group_model"
require_relative "group_view"

class GroupController 
    def initialize()
        @model = nil 
        @view = GroupView.new
        @groups = GroupModel.all
    end 

    def select_group
        choice = @view.menu_selection("Please select a group:", @groups)
        puts choice
        selected_group = @groups.find {|group| group[:name] == choice}
        puts selected_group
        @model = GroupModel.new(selected_group[:name], selected_group[:path])
        puts @model.to_s
        return @model
    end

    def group_options 
        options = {
            "Display Random Order" => 1, 
            "Add A Member" => 2, 
            "Remove A Member" => 3, 
            "Save Group" => 4,
            "Go Back" => 5
        }
        while true
        @view.output_member_message(@model.names_array.length)
        choice = @view.menu_selection("Please Choose: ", options)
        system "clear"
            case choice 
            when 1 
                @view.display_group(@model.randomise_order)
            when 2 
                name = @view.input_name("add")
                added = @model.add_name(name)
                puts "added #{name}"
                sleep(1)
            when 3
                name = @view.input_name("remove")
                removed = @model.remove_name(name)
                if removed 
                    puts "deleted #{removed}"
                else
                    puts "could not find #{name} to delete"
                end 
                sleep(1)
            when 4
                puts "Save"
                @model.save
            when 5 
                puts "Go Back"
                break
            end 
        end
    end 

    def main_menu
        while true
            choice = @view.menu_selection("What would you like to do?", {"Create a group" => 1, "Select a group" => 2, "quit" => 3 })
            case choice 
            when 1 
                name = @view.input_group_name
                GroupModel.create(name)
            when 2 
                self.select_group
                @view.display_name(@model.name)
                self.group_options
            when 3 
                puts "quit"
                break
            end 
        end
    end 


end 


controller = GroupController.new
controller.main_menu
