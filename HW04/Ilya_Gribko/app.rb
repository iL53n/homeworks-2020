# [ ] Implement your own Array#my_map, Array#my_select, Array#my_each.
# [ ] Write specs for each of your methods using RSpec.
# Notes: implement these methods in your custom module and then include it in the Array class.
# Important: Do not use #each, #select, #map in your implementation.

require_relative 'lib/my_methods'

test_array = [0, 1, 1, 2, 3, 5, 8]

### my_each
# { }
test_array.my_each { |i| puts i += 1 }
# do-end
test_array.my_each do |i|
  puts i
end