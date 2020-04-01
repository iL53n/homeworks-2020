class Notification
  attr_reader :homework

  def initialize(homework)
    @homework = homework
  end

  def add_new_homework
    student_notifications << "Add new homework #{homework.title}! You can take her to work"
  end

  def student_notifications
    homework.student.notifications
  end
end