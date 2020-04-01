class Mentor
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_homework(data)
    Homework.new(data[:title], data[:description])
  end

  def subscribe_to(student)

  end

  def read_notifications!

  end
end