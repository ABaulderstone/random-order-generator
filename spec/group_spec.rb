require_relative '../group'

describe 'group' do
    before(:each) do 
        @group = Group.new("Test Group", "./groups/test-group.txt")
        @names = File.readlines('./groups/test-group.txt').map {|name| name.gsub(/\n/, '')}

    end
    
    it "should be an instance of a Group" do 
        expect(@group).to be_a Group
    end 

    it "Should initialize with a name" do 
        expect(@group.name).to eq("Test Group")
    end 

    it "should have an array of names attribute" do 
        expect(@group.names_array).to be_an_instance_of(Array)
    end 

    it "should have a file path that matches the directory" do
        expect(@group.file_path).to match(/\.\/groups\/\S*/)
    end
    describe '.path_to_array' do 
        it "should be defined" do 
            expect(defined? @group.path_to_array).to eql("method")
        end 

        it "should return an array" do 
            expect(@group.path_to_array).to be_an_instance_of(Array)
        end
        it "should remove newline character from names" do
            expect(@group.path_to_array[0]).not_to include('\n')
        end 
        it "should populate with names from the file path" do
            expect(@group.path_to_array).to include(@names[0])
        end
    end
    
    describe '.randomise_order' do 
        it "should be defined" do 
            expect(defined? @group.randomise_order).to eql("method")
        end 

        it "should return an array" do 
            expect(@group.randomise_order).to be_an_instance_of(Array)
        end
        it "should contain the names in @names_array" do 
            expect(@group.randomise_order).to include(*@group.names_array)
        end 
    end
    
    describe '.display_random_order' do 
        it "should be defined" do 
            expect(defined? @group.display_random_order).to eql("method")
        end 

        it "should output a name from the @names_array" do 
            expect{ @group.display_random_order }.to output(/#{Regexp.quote(@group.names_array[0])}/).to_stdout
        end 
    end
    describe '.add_name' do 
        it "should be defined" do 
            expect(defined? @group.add_name).to eql("method")
        end 
        it "should increase length of @names_array" do
            length = @group.names_array.length
            expect((@group.add_name("Bob")).length).to be length + 1 
        end
    end


end 