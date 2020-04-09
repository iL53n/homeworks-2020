# [X] Implement your own Array#my_map, Array#my_select, Array#my_each.
# [X] Write specs for each of your methods using RSpec.
# Notes: implement these methods in your custom module
# and then include it in the Array class.
# Important: Do not use #each, #select, #map in your implementation.

require_relative 'lib/my_methods'

test_array = (1..10).to_a

p '#my_each'
my_each_array = test_array.my_each { |element| puts element + 1 }
p my_each_array == test_array

p '#my_map'
p new_array = test_array.my_map { |element| element + 1 }
p new_array != test_array

puts '#my_select'
p new_array = test_array.my_select { |element| element >= 3 && element <= 7 }
p new_array != test_array

# Check return
# p test_array.each { |i| i >= 3 && i <= 7 } # nil
# p test_array.my_each { |i| i >= 3 && i <= 7 } # nil
# p test_array.map { |i| i >= 3 && i <= 7 } # array true or false
# p test_array.my_map { |i| i >= 3 && i <= 7 } # array true or false
# p test_array.select { |i| i >= 3 && i <= 7 } # values array if value true
# p test_array.my_select { |i| i >= 3 && i <= 7 } # values array if value true
