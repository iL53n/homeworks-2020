# 3. Get the number 2009 using arithmetic and eleven twos
# | Output example: 2912 == 2 + 222 * 22222 / 22

def just_equation(number, equation)
  # use 'eval' here for educational purposes only
  puts "#{number} == #{equation}" if number == eval(equation)
end

just_equation(2009, '2222 - 222 + 22 / 2 - 2')
