class Group 
    attr_reader :name, :names_array, :file_path
    def initialize(name, file_path)
        @name = name
        @file_path = file_path
        @names_array = self.path_to_array
    end

    def path_to_array
       return  File.readlines(@file_path).map {|name| name.gsub(/\n/, '')}
    end 
    
    def randomise_order 
        return @names_array.shuffle
    end
    
    def display_random_order
        random_order = self.randomise_order
        random_order.each {|name| puts name}
    end 

    def add_name(name)
        @names_array.push(name)
    end
end 