class Notification
  attr_reader :homework

  def initialize(homework)
    @homework = homework
  end

  def add_new_homework
    send_student("Add new homework '#{homework.title}'! You can take her to work!")
  end

  def homework_to_work
    send_mentors("Student '#{student_str}' accept to work homework: #{homework.title}!")
  end

  def homework_to_check
    send_mentors("Student '#{student_str}' send to check homework: #{homework.title}!")
  end

  def accept_homework
    send_student("Your homework '#{homework.title}' accepted!")
  end

  def reject_homework
    send_student("Your homework '#{homework.title}' rejected!")
  end

  def send_student(message)
    student_notifications << message
  end

  def send_mentors(message)
    student_mentors.each do |mentor|
      mentor.notifications << message
    end
  end

  def student_str
    "#{homework.student.name} #{homework.student.surname}"
  end

  def student_mentors
    homework.student.mentors
  end

  def student_notifications
    homework.student.notifications
  end
end