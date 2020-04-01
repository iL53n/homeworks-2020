# Your application should describe the interaction between students and mentors.
# See example of how it should look like.
# When you implement the classes structure, create an app.rb file
# where you will show the interactions between objects like in the example.

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

module App
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

    student.submit_homework!(homework_data)
    student.homeworks # => [Homework, ...]

    mentor.subscribe_to(student)
    mentor.notifications # => []

    student.submit_homework!(homework_data)
    mentor.notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []
  end
end
