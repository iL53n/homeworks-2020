class Mentor
  attr_reader :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_homework(data)
    homework = Homework.new(data[:title], data[:description], data[:student])
    notification(homework).add_new_homework
    homework
  end

  # ToDo: refactoring_one check result method
  def reject!(homework)
    homework.status = 'to_work'
    notification(homework).reject_homework
  end

  def accept!(homework)
    homework.status = 'done'
    notification(homework).accept_homework
  end

  def subscribe_to(student)
    student.mentors << self
  end

  def mark_as_read!
    @notifications = []
  end

  private

  def notification(homework)
    Notification.new(homework)
  end
end