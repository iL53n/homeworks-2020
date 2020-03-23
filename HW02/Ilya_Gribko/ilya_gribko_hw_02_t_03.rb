# The task_3 method should return a string containing the duration of the action
# in SECONDS between events that occurred at the time of Calling core with action:
# * Between them can be any number of other events.
# * For this example, the output will be:
# (2018-04-23 17:18:38.8 - 2018-04-23 17:17:49.7) = (38.8 + 10.3) = "49.1"
# <- only this number is a string
# [ ] * If there are no valid events at the entrance or it is the only one to return "0"
# [ ] * If there are many events, the methods should return an array of duration
# between 1st and 2nd, 2nd and 3rd and etc. Example: ["40.1", "42.2"]
require 'date'

DATETIME_FORMAT = /\d{4}-\d{2}-\d{2} \d{1,2}:\d{1,2}:\d{1,2}.\d{1}/.freeze

def task_3(file_name)
  parse_log_file(file_name)
end

def parse_log_file(file_name)
  @arr = []

  File.foreach(file_name) do |f|
    if format_match?(f)
      p return_datetime(f)
      seconds = to_seconds(return_datetime(f))
      @arr << seconds
    end
  end

  n = 0
  while n < @arr.count - 1
    puts (@arr[n + 1] - @arr[n]).round(1).to_s
    n += 1
  end
end

def format_match?(line)
  line.include?('Calling core with action:') &&
  line.match?(DATETIME_FORMAT)
end

def return_datetime(line)
  line.match(DATETIME_FORMAT).to_s
end

def to_seconds(time)
  DateTime.strptime(time, '%Y-%m-%d %H:%M:%S.%L').to_time.to_f
end

task_3('debug_data_test.log')