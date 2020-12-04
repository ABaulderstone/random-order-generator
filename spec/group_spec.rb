require_relative ('../group')

describe 'group' do 
    before(:each) do 
        @group = Group.new("Test group", "./groups/test-group.txt") 
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



end 