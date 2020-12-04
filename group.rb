class Group
    attr_reader :name, :names_array, :file_path
    def initialize(name,file_path)
        @name = name
        @file_path = file_path
        @names_array = self.path_to_array || []
        
    end

    def add_name(name)
       return @names_array.push(name)
    end
    
    def to_s 
        return "Name: #{@name} Members: #{@names_array}"
    end
    
    def path_to_array
        return File.readlines(@file_path).map {|name| name.strip}
    end 

    
    

end

group = Group.new("Test group", "./groups/test-group.txt")
puts group.to_s
