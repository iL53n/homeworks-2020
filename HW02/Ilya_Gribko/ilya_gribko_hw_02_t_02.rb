# Method task_2 should return:
# [X] an array of formatted strings containing information about post requests;
# * for the example above, the result should be:
# [
#   "23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES",
#   "23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN",
#   "23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES"
# ]
# [X] lines that do not match the format should be ignored
# [X] if there is no suitable string at the input,
#   the method should return an empty array
# [X] Rubocop check
# IP_format -- [DATE_format] "MESSAGE_format" ...
# "DATE_format FROM: IP_format TO: MESSAGE_format"

IP_FORMAT = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
DATE_FORMAT = %r{\d{1,2}/\w+/\d{4}:\d{2}:\d{2}:\d{2} \+\d{1,4}}.freeze
MESSAGE_FORMAT = %r{(?<= "POST )(.+)(?= HTTP/1.1)}.freeze

class Task2
  def initialize(file_name)
    @arr = []
    task_2(file_name) if check_file_name?(file_name)
  end

  def task_2(file_name)
    parse_log_file(file_name)
    @arr.empty? ? @arr : puts(@arr)
  end

  private

  def check_file_name?(file_name)
    File.exist?(file_name) ? true : puts('File not found!')
  end

  def parse_log_file(file_name)
    File.foreach(file_name) do |f|
      @arr << parse_line(f) if format_match?(f)
    end
  end

  def parse_line(line)
    ip = line.match(IP_FORMAT)
    date = line.match(DATE_FORMAT)
    message = line.match(MESSAGE_FORMAT).to_s.capitalize
    "#{date} FROM: #{ip} TO: #{message}"
  end

  def format_match?(line)
    line.match?(IP_FORMAT) &&
      line.match?(DATE_FORMAT) &&
      line.match?(MESSAGE_FORMAT)
  end
end

Task2.new('data_test_with_errors.log')
