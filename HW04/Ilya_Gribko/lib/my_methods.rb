# 1. Array#my_each
# Executes code in block for each element of the array
# array.each { |item| block }
# 2. Array#my_map
# Executes code in block for each element of the array and return *new* array
# array.map {|item| block }  #=> array
# 3. Array#select
# Returns an array containing all `enum` elements for which the result of processing block is not `false`
# enum.select {| obj | block }  => array

class Array
  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
  end

  def my_map
    return_array = []

    i = 0
    while i < size
      return_array << yield(self[i])
      i += 1
    end

    return_array
  end

  def my_select
    return_array = []

    i = 0
    while i < size
      return_array << yield(self[i])
      i += 1
    end

    return_array
  end
end



