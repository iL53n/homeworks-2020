class Notification
  attr_reader :homework

  def initialize(homework)
    @homework = homework
  end

  def add_new_homework
    student_notifications << "Add new homework #{homework.title}! You can take her to work!"
  end

  def homework_to_work
    student_mentors.each do |mentor|
      mentor.notifications << "Student '#{homework.student.name} #{homework.student.surname}' accept to work homework: #{homework.title}!"
    end
  end

  def student_mentors
    homework.student.mentors
  end

  def student_notifications
    homework.student.notifications
  end
end