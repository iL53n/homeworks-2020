# [X] Implement your own Array#my_map, Array#my_select, Array#my_each.
# [ ] Write specs for each of your methods using RSpec.
# Notes: implement these methods in your custom module and then include it in the Array class.
# Important: Do not use #each, #select, #map in your implementation.

require_relative 'lib/my_methods'

test_array = (1..10).to_a

# check return
p test_array.each { |i| i >= 3 && i <= 7 } # nil
p test_array.my_each { |i| i >= 3 && i <= 7 } # nil
p test_array.map { |i| i >= 3 && i <= 7 } # array true or false
p test_array.my_map { |i| i >= 3 && i <= 7 } # array true or false
p test_array.select { |i| i >= 3 && i <= 7 } # values array if value true
p test_array.my_select { |i| i >= 3 && i <= 7 } # values array if value true


### my_each
# { }
test_array.my_each { |i| print i += 1 }
# do-end
# test_array.my_each do |i|
#   print i
# end

### my_map
# { }
# new_array = test_array.my_map { |i| puts i += 1 }
# puts new_array.class == Array
# do-end
# new_array = test_array.my_map do |i|
#   puts i
# end
# puts new_array.class == Array

### my_select
# { }
# test_array.my_select { |i| puts i += 1 }
# do-end
# test_array.my_select do |i|
#   puts i
# end