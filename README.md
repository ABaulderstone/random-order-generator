# Student Randomizer:
## Install 
```
 bundle install 
```

## Running the App 
Bash script `runner.sh` included, you may need to change permissions to use the script
or `ruby index.rb` to launch application
### Arguments
- `-help` - displays help info
- `-info` - displays program info
- `-path {path}` - instansiates a group based on the path given
  


## Group useage
The Group class requires a file to read, located in the groups directory. It comes with test-group as an example. See `.file_to_path` for implementation

## Dependencies
 - espeak-ruby gem requires local install of espeak. Check [the docs](https://github.com/dejan/espeak-ruby)
## Requirement
- Needs to use loops where possibly (no iterators)
- All variables in snake case
- Follow ruby conventions
- Take names as input
- See the size of the class
- Produce a random order
- Has to be able to output to the screen
- Store the names
- A rudimentary menu

## Extras (sprinkles)
- pause between output names
- Add data formatting
- Read a external file
- Write a external file
- Read out each name

## Implementation Details
- Use pop
