class Homework
  attr_accessor :status, :student, :answer
  attr_reader :title, :description

  def initialize(title, description, student)
    @title = title
    @description = description
    @student = student
    @answer = ''
    @status = 'new'
  end
end