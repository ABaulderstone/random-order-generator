require_relative "group"
group = Group.new("Test", './groups/melb-fxb.txt')
puts "#{group.names_array}"