class GroupModel

    def self.all 
        contents = Dir.entries('./groups').select {|file| file =~ /^.+\.txt/}
        contents.map do |file| 
            words = file.split("-")
            words[-1].delete_suffix!(".txt")
            words.map! {|word| word.capitalize}
            {name: words.join(" "), path: "./groups/#{file}"}
        end
    end 

    def self.create(name)
        path = name.split(" ").map {|word| word.downcase}.join("-") + ".txt"
        File.open("./groups/#{path}", "w") do |file|
            file.write("")
        end 
        puts "created file"
        sleep(1)
    end 

    attr_reader :name, :names_array, :file_path
    def initialize(name,file_path)
        @name = name
        @file_path = file_path
        @names_array = self.path_to_array || []
        
    end

    def add_name(name)
       return @names_array.push(name)
    end

    def remove_name(name)
        return @names_array.delete(name)
    end
    
    def to_s 
        return "Name: #{@name} Members: #{@names_array}"
    end
    
    def path_to_array
        begin
            array = File.readlines(@file_path).map {|name| name.strip}
        rescue
            puts "Invalid path. Creating file"
            File.open(@file_path, "w") do |file| 
                file.write("")
            end 
            array = []
        end
        return array 
    end 

    def randomise_order
        return @names_array.shuffle
    end

    def save
        File.open(@file_path, "w+") do |file|
            file.puts(@names_array)
        end
    end

end 


