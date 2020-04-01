class Mentor
  attr_reader :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_homework(data)
    homework = Homework.new(data[:title], data[:description], data[:student])
    # notification to student
    Notification.new(homework).add_new_homework
    homework
  end

  # ToDo: refactoring_one check result method
  def reject!(homework)
    homework.status = 'to_work'
    # notification to student
  end

  def accept!(homework)
    homework.status = 'done'
    # notification to student
  end

  def subscribe_to(student)
    student.mentors << self
  end


  def mark_as_read!
    @notifications = []
  end
end