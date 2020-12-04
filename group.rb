class Group
    attr_reader :name, :names_array, :file_path
    def initialize(name,file_path)
        @name = name
        @names_array = []
        @file_path = file_path
    end

    def add_name(name)
       return @names_array.push(name)
    end
    
    def to_s 
        return "Name: #{@name} Members: #{@names_array}"
    end 

    
    

end

