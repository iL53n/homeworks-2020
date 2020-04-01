class Student
  attr_reader :name, :surname, :homeworks, :notifications, :mentors

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
    @mentors = []
  end

  # def homeworks
  #   @homeworks.each do |homework|
  #     puts "Status: #{homework.status} ---> #{homework.title} '#{homework.description}'"
  #   end
  # end
  #
  # def notifications
  #   @notifications.empty? ? puts('No messages!') : @notifications.each { |message| puts(message) }
  # end

  def mark_as_read!
    @notifications = []
  end

  def to_work!(homework)
    homework.status = 'to_work'
    @homeworks << homework
    notification(homework).homework_to_work
  end

  def add_answer!(homework, answer)
    homework.answer = answer
  end

  def to_check!(homework)
    homework.status = 'to_check'
    notification(homework).homework_to_check
  end

  private

  def notification(homework)
    Notification.new(homework)
  end
end