# 1. Array#my_each
# Executes code in block for each element of the array
# array.each { |item| block }  #=> array

class Array
  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
  end

  def my_map

  end

  def my_select

  end
end



