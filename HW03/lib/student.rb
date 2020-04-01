class Student
  attr_reader :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
  end

  def to_work(homework)
    homework.student = self
    homework.status = 'to_work'
    @homeworks << homework
    # notification to mentor if mentor subscribed
  end

  def add_answer(homework, answer)
    homework.answer = answer
  end

  def to_check(homework)

  end

  def submit_homework!(homework_data)

  end
end