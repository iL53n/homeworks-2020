class Homework
  attr_accessor :status, :student, :answer
  attr_reader :title, :description

  def initialize(title, description)
    @title = title
    @description = description
    @student = nil
    @answer = ''
    @status = 'new'
  end
end