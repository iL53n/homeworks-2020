# Method task_1 should return:
# * Full text of the first line with an error (the presence of the substring error in any case)
# * If the input is text that does not contain the word error, return an empty string

def task_1(file_name)
  File.foreach(file_name) do |f|
    if error?(f)
      puts f
      break # only first error line
    end
  end
end

def error?(line)
  line.include?('error')
end

task_1('data_test.log')