# Method task_2 should return:
# * an array of formatted strings containing information about post requests;
# * for the example above, the result should be:
# [
#   "23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES",
#   "23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN",
#   "23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES"
# ]
# * lines that do not match the format should be ignored
# * if there is no suitable string at the input,
#   the method should return an empty array
#
# 10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
# IP_format -- [DATE_format] "MESSAGE_format" ...
# "DATE_format FROM: IP_format TO: MESSAGE_format"

IP_FORMAT = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
DATE_FORMAT = %r{\d{1,2}/\w+/\d{4}:\d{2}:\d{2}:\d{2} \+\d{1,4}}.freeze
MESSAGE_FORMAT = /\"(.+)\"/.freeze


def task_2(file_name)
  File.foreach(file_name) do |f|
    ip = f.match(IP_FORMAT)
    date = f.match(DATE_FORMAT)
    message = f.match(MESSAGE_FORMAT)
    puts "#{date} FROM: #{ip} TO: #{message}"
    break
  end
end

task_2('data_test_with_errors.log')