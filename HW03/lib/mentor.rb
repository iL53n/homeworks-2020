class Mentor
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_homework(data)
    Homework.new(data[:title], data[:description])
    # notification to student
  end

  # ToDo: refactoring_one check result method
  def reject(homework)
    homework.status = 'to_work'
    # notification to student
  end

  def accept(homework)
    homework.status = 'done'
    # notification to student
  end

  def subscribe_to(student)

  end

  def read_notifications!

  end
end