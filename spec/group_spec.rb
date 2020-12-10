require_relative ('../group')

describe 'group' do 
    before(:each) do 
        @group = Group.new("Test group", "./groups/test-group.txt")
        @names = File.readlines("./groups/test-group.txt").map {|name| name.strip} 
    end 
    
    it 'should be an instance of a Group' do 
        expect(@group).to be_a Group
    end
    
    it 'should initialize with a name' do 
        expect(@group.name).to eq("Test group") 
    end
    
    it 'should have an array of names attribute' do
        expect(@group.names_array).to be_an_instance_of(Array)
    end

    it 'should have a file_path as a String' do
        expect(@group.file_path).to be_an_instance_of(String)
    end

    it 'should have a file path that matches the file directory' do 
        expect(@group.file_path).to match(/^\.\/groups\/\S+/)
    end 

    describe '.add_name' do 
        it 'should be defined' do 
            expect(defined? @group.add_name).to eq("method")
        end
        
        it "should increase the length of @names_array" do 
            length = @group.names_array.length
            expect(@group.add_name("Alice").length).to be length + 1 
        end 
    end
    
    describe '.to_s' do 
        it 'should be defined' do 
            expect(defined? @group.to_s).to eq("method")
        end
        it 'should return the group name' do 
            expect(@group.to_s).to include("Test group")
        end 
    end
    
    describe '.path_to_array' do 
        it 'should be defined' do 
            expect(defined? @group.path_to_array).to eq("method")
        end

        it 'should return an Array' do 
            expect(@group.path_to_array).to be_an_instance_of(Array)
        end
        
        it 'should remove newline from names' do 
            expect(@group.path_to_array[0]).not_to include("\n")
        end
        it "should populate with names from the file path" do 
            expect(@group.path_to_array).to include(@names[0])
        end

        describe '.randomise_order' do 
            it 'should be defined' do 
                expect(defined? @group.randomise_order).to eq("method")
            end
            it 'should return an Array' do 
                expect(@group.randomise_order).to be_an_instance_of(Array)
            end
            it 'should contain the names in @names_array' do 
                expect(@group.randomise_order).to include(*@group.names_array)
            end 
        end 
        
        describe '.display_random_order' do 
            it 'should be defined' do 
                expect(defined? @group.display_random_order).to eq("method")
            end
            it 'should output a name from @names_array' do 
                expect{@group.display_random_order}.to output(/#{Regexp.quote(@group.names_array[0])}/).to_stdout
            end 
        end 
    end 



end 