# The task_3 method should return a string containing the duration of the action
# in SECONDS between events that occurred at the time of Calling core with action:
# * Between them can be any number of other events.
# * For this example, the output will be:
# (2018-04-23 17:18:38.8 - 2018-04-23 17:17:49.7) = (38.8 + 10.3) = "49.1"
# <- only this number is a string
# [ ] * If there are no valid events at the entrance or it is the only one to return "0"
# [ ] * If there are many events, the methods should return an array of duration
# between 1st and 2nd, 2nd and 3rd and etc. Example: ["40.1", "42.2"]

def task_3(file_name)
  parse_log_file(file_name)
end

def parse_log_file(file_name)
  File.foreach(file_name) do |f|
    puts f
  end
end

task_3('debug_data_test.log')