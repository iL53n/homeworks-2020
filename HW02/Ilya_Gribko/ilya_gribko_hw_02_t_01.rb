# Method task_1 should return:
# * Full text of the first line with an error (the presence of the substring error in any case)
# * If the input is text that does not contain the word error, return an empty string

class Task1
  def initialize(file_name)
    @error = false
    task_1(file_name)
  end

  def task_1(file_name)
    File.foreach(file_name) do |f|
      if error?(f)
        error_line(f)
        break # only first error line
      end
    end
    puts '' unless @error # return an empty line
  end

  private

  def error?(line)
    line.include?('error')
  end

  def error_line(line)
    puts line
    @error = true
  end
end

puts 'Return from errors file:'
Task1.new('data_test_with_errors.log')

puts 'Return from NOT errors file:'
Task1.new('data_test_without_errors.log')


