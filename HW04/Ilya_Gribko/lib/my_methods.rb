# 1. Array#my_each
# Executes code in block for each element of the array
# array.each { |item| block }
# 2. Array#my_map
# Executes code in block for each element of the array and return *new* array
# array.map {|item| block }  #=> array
# 3. Array#select
# Returns an array containing all `enum` elements for which the result
# of processing block is not `false`
# enum.select {| obj | block }  => array

class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < size
      yield(self[i])
      i += 1
    end

    self
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    map_array = []

    i = 0
    while i < size
      map_array << yield(self[i])
      i += 1
    end

    map_array
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    select_array = []

    i = 0
    while i < size
      select_array << self[i] if yield(self[i])
      i += 1
    end

    select_array
  end
end
