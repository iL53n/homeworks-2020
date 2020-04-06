class Notification
  attr_reader :homework

  def initialize(homework:)
    @homework = homework
  end

  def add_new_homework
    notify(receiver: :student,
           message: "Add new homework '#{homework.title}'!")
  end

  def homework_to_work
    notify(receiver: :mentors,
           message: "Student '#{student_full_name}' " \
                    "accept to work: #{homework.title}!")
  end

  def homework_to_check
    notify(receiver: :mentors,
           message: "Student '#{student_full_name}' " \
                    "send to check: #{homework.title}!")
  end

  def accept_homework
    notify(receiver: :student,
           message: "Your homework '#{homework.title}' accepted!")
  end

  def reject_homework
    notify(receiver: :student,
           message: "Your homework '#{homework.title}' rejected!")
  end

  private

  def notify(receiver:, message:)
    if receiver == :student
      notify_student(message)
    elsif receiver == :mentors
      notify_mentors(message)
    end
  end

  def notify_student(message)
    student_notifications << message
  end

  def notify_mentors(message)
    student_mentors.each do |mentor|
      mentor.notifications << message
    end
  end

  def student_full_name
    "#{homework.student.name} #{homework.student.surname}"
  end

  def student_mentors
    homework.student.mentors
  end

  def student_notifications
    homework.student.notifications
  end
end
