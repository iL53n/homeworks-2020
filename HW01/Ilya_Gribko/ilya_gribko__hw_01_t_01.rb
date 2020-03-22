# 1. If you look at the clock and the time is 3:15,
# what is the angle between the hours and the minutes hands?
# | If this task is too easy for you,
# | try to implement a common solution for any time (3:15, 3:20, 4:30 ... etc )

def angle_time
  loop do
    puts 'What time is it?(analog):'
    time = gets.chomp

    if time != '' && time_check(time)
      implement(time)
      break
    end
  end
end

private

def implement(time)
  time_array = time.split(':')
  degrees = angle(time_array)
  puts "#{degrees} degrees"
end

def angle(time)
  hours_position = time[0].to_i * 30
  minutes_position = time[1].to_i * 6
  angle = (hours_position - minutes_position).abs
  angle > 180 ? 360 - angle : angle
end

def time_check(input)
  input =~ /^\d{1,2}:\d{2}$/
end

angle_time
